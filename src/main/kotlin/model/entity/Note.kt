package model.entity

import java.time.LocalDate

/**
 * TODO commentaires.
 */
class Note(
    var id: Int?,
    var note: Float,
    var typeEvaluation: String,
    var dateEvaluation: LocalDate,
    var etudiantId: Int?,
    var matiereId: Int?
) {
    override fun toString(): String {
        return "Note(id=$id, note=$note, typeEvaluation='$typeEvaluation', dateEvaluation=$dateEvaluation, etudiantId=$etudiantId, matiereId=$matiereId)"
    }
}