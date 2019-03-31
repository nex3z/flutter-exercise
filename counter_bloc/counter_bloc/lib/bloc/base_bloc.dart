abstract class BaseBloc<Event> {

  void dispose();

  void dispatch(Event event) {}

}