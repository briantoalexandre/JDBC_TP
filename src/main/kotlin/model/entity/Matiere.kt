package model.entity

/**
 *
 */
class Matiere(
    var id: Int?,
    var nom: String,
    var coefficient: Float
) {
    override fun toString(): String {
        return "Matiere(id=$id, nom='$nom', coefficient=$coefficient)"
    }
}