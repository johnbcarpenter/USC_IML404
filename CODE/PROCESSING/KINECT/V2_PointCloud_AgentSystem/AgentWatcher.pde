class AgentWatcher {
  ArrayList<Agent> agents;

  AgentWatcher() { 
    agents = new ArrayList<Agent>(); 
  }

  void addAgent(PVector _starting_loc) {
    agents.add(new Agent(_starting_loc));
  }

  void updateAndDrawAgents() {
    for (int i = agents.size() - 1; i >= 0; i--) {
      Agent a = agents.get(i);

      if (a.life_span <= 0)
        agents.remove(i);
      else {
        a.updateAndDrawSelf();
      }
    }
  }
}
