package model.entity

import java.time.LocalDate

/**
 * TODO commentaires.
 */
class Note(
    var id: Int?,
    var note: Float,
    var typeEvaruation: String,
    var dateEvaruation: LocalDate
)