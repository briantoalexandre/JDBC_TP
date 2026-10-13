package model.entity

import java.time.LocalDate

/**
 *
 */
class Etudiant(
    val id: Int?,
    val nom: String,
    val prenom: String,
    val email: String,
    val dateNaissance: LocalDate
)