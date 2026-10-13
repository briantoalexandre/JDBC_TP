package model.entity

import java.time.LocalDate

/**
 * TODO commentaires.
 */
class Note(
    val id: Int?,
    val note: Float,
    val typeEvaluation: String,
    val dateEvaluation: LocalDate
)