import model.dao.EtudiantDAO
import org.example.jdbc.BDD

val db = BDD()
val etudiantDAO = EtudiantDAO()
fun main() {
    db.getConnection()
    val etudiants = etudiantDAO.findAll()
    for (etudiant in etudiants) {
        println("${etudiant.id} => ${etudiant.nom}")
    }
    db.close()
}