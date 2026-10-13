package model.dao

import db
import model.entity.Etudiant
import model.entity.Matiere
import model.entity.Note
import org.example.jdbc.BDD
import java.sql.PreparedStatement
import java.sql.SQLException
import java.sql.Statement

/**
 * TODO commentaire
 */

class NoteDAO(val bdd: BDD = db) {
    
    /**
     * TODO commentaire
     */
    
    fun findAll(): MutableList<Note> {
        val result = mutableListOf<Note>()
        val sql = "SELECT * FROM note"
        val requetePreparer = bdd.connectionBDD!!.prepareStatement(sql)
        val resultatRequete = bdd.executePreparedStatement(requetePreparer)
        if (resultatRequete != null) {
            while (resultatRequete.next()) {
                val id = resultatRequete.getInt("id")
                val note = resultatRequete.getFloat("note")
                val typeEvaluation = resultatRequete.getString("type_evaluation")
                val dateEvaluation = resultatRequete.getDate("date_evaluation")

                val etudiant_id = resultatRequete.getInt("etudiant_id")
                val matiere_id = resultatRequete.getInt("matiere_id")

                result.add(Note(id, note, typeEvaluation, dateEvaluation.toLocalDate(), etudiant_id, matiere_id))
            }
        }
        requetePreparer.close()
        return result
    }

    /**
     * TODO commentaire
     */

    fun save(note: Note, etudiant: Etudiant, matiere: Matiere): Note? {
        val requetePreparer: PreparedStatement
        if (note.id == null) {
            // Insertion
            val sql = """
INSERT INTO note (note, type_evaluation, date_evaluation, etudiant_id, matiere_id)
VALUES (?, ?, ?, ?, ?)
""".trimIndent()
            requetePreparer = bdd.connectionBDD!!.prepareStatement(
                sql,
                Statement.RETURN_GENERATED_KEYS
            )
            requetePreparer.setFloat(1, note.note)
            requetePreparer.setString(2, note.typeEvaluation)
            requetePreparer.setDate(3, java.sql.Date.valueOf(note.dateEvaluation))
            requetePreparer.setInt(4,  etudiant.id!!)
            requetePreparer.setInt(5,  matiere.id!!)


            val nbLigneMaj = requetePreparer.executeUpdate()
            if (nbLigneMaj > 0) {
                val generatedKeys = requetePreparer.generatedKeys
                if (generatedKeys.next()) {
                    note.id = generatedKeys.getInt(1)
                }
                generatedKeys.close()
                requetePreparer.close()
                return note
            }
        } else {
            // Mise à jour
            val sql = """
UPDATE note
SET note = ?, type_evaluation = ?, date_evaluation = ?
WHERE id = ?
""".trimIndent()
            requetePreparer = bdd.connectionBDD!!.prepareStatement(sql)
            requetePreparer.setFloat(1, note.note)
            requetePreparer.setString(2, note.typeEvaluation)
            requetePreparer.setDate(3, java.sql.Date.valueOf(note.dateEvaluation))

            requetePreparer.setInt(4, note.id!!)
            val nbLigneMaj = requetePreparer.executeUpdate()
            requetePreparer.close()
            if (nbLigneMaj > 0) {
                return note
            }
        }
        requetePreparer.close()
        return null
    }

    /**
     * TODO commentaire
     */

    fun deleteById(id: Int): Boolean {
        val sql = "DELETE FROM note WHERE id = ?"
        val requetePreparer = bdd.connectionBDD!!.prepareStatement(sql)
        requetePreparer.setInt(1, id)
        return try {
            val nbLigneMaj = requetePreparer.executeUpdate()
            requetePreparer.close()
            nbLigneMaj > 0
        } catch (erreur: SQLException) {
            println("Erreur lors de la suppression de la note : ${erreur.message}")
            false
        }
    }
}