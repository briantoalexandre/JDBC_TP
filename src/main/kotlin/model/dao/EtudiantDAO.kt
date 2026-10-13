package model.dao

import db
import model.entity.Etudiant
import org.example.jdbc.BDD

/**
 * classe etudiantDAO
 *
 * @property [bdd] la base de donnée
 */
class EtudiantDAO (val bdd: BDD = db) {

    /**
     * Récupère les étudiants de la table etudiant
     *
     * @return retourne une liste qui contient tous les Etudiant
     */
    fun findAll(): MutableList<Etudiant> {
        val result = mutableListOf<Etudiant>()
        val sql = "SELECT * FROM etudiant"
        val requetePreparer = bdd.connectionBDD!!.prepareStatement(sql)
        val resultatRequete = bdd.executePreparedStatement(requetePreparer)
        if (resultatRequete != null) {
            while (resultatRequete.next()) {
                val id = resultatRequete.getInt("id")
                val nom = resultatRequete.getString("nom")
                val prenom = resultatRequete.getString("prenom")
                val email = resultatRequete.getString("email")
                val dateNaissance = resultatRequete.getDate("date_naissance")
                result.add(Etudiant(id, nom, prenom, email, dateNaissance.toLocalDate()))
            }
        }
        requetePreparer.close()
        return result

    }
}
