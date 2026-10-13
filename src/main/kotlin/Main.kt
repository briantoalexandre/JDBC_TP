import model.dao.EtudiantDAO
import org.example.jdbc.BDD

val db = BDD()
val etudiantDAO = EtudiantDAO()
fun main() {
    val test1 = etudiantDAO.findByNom("CARON-NAGEL")
    println(" resultat = ${test1?.nom} ${test1?.prenom}" )

    val test2 = etudiantDAO.findByNom("TRUC")
    println(" resultat = ${test2?.nom} ${test2?.prenom}")

    val test3 = etudiantDAO.findByNom("' OR '1'='1")
    println(" resultat = ${test3?.nom} ${test3?.prenom}" )
}