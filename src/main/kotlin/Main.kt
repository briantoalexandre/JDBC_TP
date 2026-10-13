import model.dao.*
import model.entity.*

import org.example.jdbc.BDD
import java.time.LocalDate

val db = BDD()
val etudiantDAO = EtudiantDAO()
val matiereDAO = MatiereDAO()
val noteDAO = NoteDAO()

fun main() {
    db.getConnection()
    afficherMenu()
    db.close()
}

fun afficherMenu() {
    var choix: String
    do {
        println()
        println("================================")
        println("Application Evaluation")
                println("================================")
                println("s - Sélectionner un étudiant")
                println("a - Ajouter un étudiant")
                println("q - Quitter")
                println()
                choix = readln().lowercase()
            when (choix) {
                "s" -> selectionnerEtudiant()
                "a" -> ajouterEtudiant()
                "q" -> println("Au revoir !")
                else -> println("Choix invalide")
            }
    } while (choix != "q")
}

fun selectionnerEtudiant() {
    afficherEtudiants()
    println("Sélectionner un étudiant :")
    val id = readln().toInt()
    val etudiant = etudiantDAO.findById(id)
    if (etudiant == null) {
        println("Étudiant introuvable.")
        return
    }
    afficherEtudiant(etudiant)
    afficherMenuEtudiant(etudiant)
}

fun afficherEtudiants() {
    val etudiants = etudiantDAO.findAll()
    println()
    println("Liste des étudiants")
    println("--------------------")
    for (etudiant in etudiants) {
        println("${etudiant.id} => ${etudiant.nom} ${etudiant.prenom}")
    }
}
fun afficherEtudiant(etudiant: Etudiant) {
    println()
    println("Étudiant sélectionné")
    println("--------------------")
    println("Nom : ${etudiant.nom}")
    println("Prénom : ${etudiant.prenom}")
    println("Email : ${etudiant.email}")
    println("Date de naissance : ${etudiant.dateNaissance}")
}


fun afficherMenuEtudiant(etudiant: Etudiant) {
    println()
    println("----------------------------")

    println("1 - Supprimer")
    println("2 - Modifier")
    println("3 - Afficher notes")
    println("4 - Ajouter une note")
    println("5 - modifier une note")
    println("6 - supprimer une note")
    println("7 - Retour")

    val choix = readln()
    when (choix) {
        "1" -> supprimerEtudiant(etudiant)
        "2" -> modifierEtudiant(etudiant)
        "3" -> afficherNotes()
        "4" -> ajouterNote()
        "5" -> modifierEtudiant(etudiant)
        "6" -> modifierEtudiant(etudiant)
        "7" -> println("Retour au menu principal.")
        else -> println("Choix invalide.")
    }

}
fun supprimerEtudiant(etudiant: Etudiant) {
    val id = etudiant.id
    if (id == null) {
        println("Impossible de supprimer cet étudiant.")
        return
    }
    etudiantDAO.deleteById(id)
    afficherMenuEtudiant(etudiant)
}

fun modifierEtudiant(etudiant: Etudiant) {
    println("Nom :")
    etudiant.nom = readln()
    println("Prénom :")
    etudiant.prenom = readln()
    println("Email :")
    etudiant.email = readln()
    println("Date de naissance (AAAA-MM-JJ) :")
    etudiant.dateNaissance = LocalDate.parse(readln())
    etudiantDAO.save(etudiant)
    println("Étudiant modifié.")
}

fun ajouterEtudiant() {
    println()
    println("Ajout d'un étudiant")
    println("-------------------")
    println("Nom :")
    val nom = readln()
    println("Prénom :")
    val prenom = readln()
    println("Email :")
    val email = readln()
    println("Date de naissance (AAAA-MM-JJ) :")
    val dateNaissance = LocalDate.parse(readln())
    val etudiant = Etudiant(
        null,
        nom,
        prenom,
        email,
        dateNaissance
    )
    etudiantDAO.save(etudiant)
    println("Étudiant ajouté avec l'id ${etudiant.id}.")
}

fun afficherNotes() {
    val notes = noteDAO.findAll()
    println()
    println("Liste des notes")
    println("--------------------")
    for (note in notes) {
        println("${note.id} => ${note.note} ${matiereDAO.findById(note.matiereId!!)?.nom ?: "-"}")
    }
}

fun afficherNote() {}

fun ajouterNote() {
    println()
    println("Ajout d'un note")
    println("-------------------")
    println("note :")
    val noteV = readln()
    println("type de l'évaluation :")
    val typeEvaluation = readln()
    println("dateEvaluation (AAAA-MM-JJ) :")
    val dateEvaluation = readln()
    val note = Note(
        null,
        noteV.toFloat(),
        typeEvaluation,
        LocalDate.parse(dateEvaluation),
        null,
        null
    )
    noteDAO.save(note)
    println("Étudiant ajouté avec l'id ${note.id}.")
}
fun modifierNote() {}
fun supprimerNote() {}