package model.entity

import java.time.LocalDate

/**
 *
 */
class Etudiant(
    var id: Int?,
    var nom: String,
    var prenom: String,
    var email: String,
    var dateNaissance: LocalDate
) {
    override fun toString(): String {
        return "Etudiant(id=$id, nom='$nom', prenom='$prenom', email='$email', dateNaissance=$dateNaissance)"
    }
}