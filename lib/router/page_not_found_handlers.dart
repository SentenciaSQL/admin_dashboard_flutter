import 'package:admin_dasboard/providers/sidemenu_provider.dart';
import 'package:admin_dasboard/ui/views/page_not_found_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class PageNotFoundHandlers {
  
  static Handler notFoundHandler = Handler(
    handlerFunc: (context, params) {

      Provider.of<SidemenuProvider>(context!, listen: false).setCurrentPageUrl('/404');

      return const PageNotFoundView();
    },
  );
}