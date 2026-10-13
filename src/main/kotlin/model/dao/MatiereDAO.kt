package model.dao

import db
import model.entity.Etudiant
import model.entity.Matiere
import org.example.jdbc.BDD

/**
 * TODO commentaire
 */
class MatiereDAO(val bdd: BDD = db) {

    /**
     * TODO commentaire
     */
    fun findAll(): MutableList<Matiere> {
        val result = mutableListOf<Matiere>()
        val sql = "SELECT * FROM matiere"
        val requetePreparer = bdd.connectionBDD!!.prepareStatement(sql)
        val resultatRequete = bdd.executePreparedStatement(requetePreparer)
        if (resultatRequete != null) {
            while (resultatRequete.next()) {
                val id = resultatRequete.getInt("id")
                val nom = resultatRequete.getString("nom")
                val coefficient = resultatRequete.getFloat("coefficient")

                result.add(Matiere(id, nom, coefficient))
            }
        }
        requetePreparer.close()
        return result
    }

    /**
     * TODO commentaire
     */
    fun findById(id: Int): Matiere? {
        var result: Matiere? = null
        val sql = "SELECT * FROM matiere WHERE id = ?"
        val requetePreparer = bdd.connectionBDD!!.prepareStatement(sql)
        requetePreparer.setInt(1, id) // insere la valeur de l'id dans la requete preparer

        val resultatRequete = bdd.executePreparedStatement(requetePreparer)
        if (resultatRequete != null && resultatRequete.next()) {
            val nom = resultatRequete.getString("nom")
            val coefficient = resultatRequete.getFloat("coefficient")
            result = Matiere(id, nom, coefficient)
        }
        requetePreparer.close()
        return result
    }
    
    
}