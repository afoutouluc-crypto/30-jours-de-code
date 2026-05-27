# Jour 26 - Algorithme de Dijkstra (plus court chemin)
# Niveau L2 - Théorie des graphes
 
import heapq
 
def dijkstra(graphe, source):
    """
    Algorithme de Dijkstra pour trouver le plus court chemin.
    graphe : dict {sommet: [(voisin, poids), ...]}
    Retourne les distances et les prédécesseurs.
    """
    distances = {s: float('inf') for s in graphe}
    distances[source] = 0
    predecesseurs = {s: None for s in graphe}
    file = [(0, source)]  # (distance, sommet)
 
    while file:
        dist_u, u = heapq.heappop(file)
        if dist_u > distances[u]:
            continue
        for voisin, poids in graphe[u]:
            nouvelle_dist = distances[u] + poids
            if nouvelle_dist < distances[voisin]:
                distances[voisin] = nouvelle_dist
                predecesseurs[voisin] = u
                heapq.heappush(file, (nouvelle_dist, voisin))
 
    return distances, predecesseurs
 
def reconstruire_chemin(predecesseurs, source, destination):
    chemin = []
    courant = destination
    while courant is not None:
        chemin.append(courant)
        courant = predecesseurs[courant]
    return list(reversed(chemin))
 
if __name__ == "__main__":
    graphe = {
        'A': [('B', 4), ('C', 2)],
        'B': [('D', 5), ('C', 1)],
        'C': [('B', 1), ('D', 8), ('E', 10)],
        'D': [('E', 2)],
        'E': []
    }
 
    distances, predecesseurs = dijkstra(graphe, 'A')
    for sommet, dist in distances.items():
        chemin = reconstruire_chemin(predecesseurs, 'A', sommet)
        print(f"A -> {sommet} : distance {dist}, chemin {' -> '.join(chemin)}")
 