exports.getBlocEventContent = (name, className) => {
return `
abstract class ${className}Event {}

class GetDataEvent extends ${className}Event {}
`;
}

exports.getBlocBlocContent = (name, className) => {
return `
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';
import '../../repository/${name}/${name}_imp.dart';
import '${name}_event.dart';
import '${name}_state.dart';
    
class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
    //${className} repo instance
    final _${className}Repo = ${className}RepoImp();

    ${className}Bloc() : super(${className}Initial(0)) {
        on<GetDataEvent>(_getData);
    }
    
    Future<void> _getData(
        ${className}Event event, Emitter<${className}State> emit) async {
        emit(${className}Loading());
        if (event is GetDataEvent) {
          try {
            await _${className}Repo
                .get${className}();

            emit(${className}Success());
          } on FirebaseAuthException catch (e) {
            print(e);
            emit(${className}Error(e.message));
          }
        }
    }
}
`;
}

exports.getBlocStateContent = (name, className) => {
return `
import '../../data/models/${name}.dart';

abstract class ${className}State {}

//This is innitial state of bloc
class ${className}Initial extends ${className}State {
  late final int value;
  ${className}Initial(this.value);
}

//This is the loading state of bloc
class ${className}Loading extends ${className}State {}

//This is the success state of bloc
class ${className}Success extends ${className}State {
  ${className}Model? data;
  ${className}Success({this.data});
}

//This is the error state of bloc
class ${className}Error extends ${className}State {
  late final dynamic error;
  ${className}Error(this.error);
}
`;
}

exports.getRepoImpContent = (name, className) => {
return `
import '../../data/models/${name}.dart';
import '../../data/remote/firebase/firebase_service.dart';
import '${name}_repo.dart';

class ${className}RepoImp extends ${className}Repo {
  final FirebaseService _fireBaseService = FirebaseService();

  @override
  Future<${className}Model?> get${className}() async {
    try {
      return await _fireBaseService.get${className}();
    } catch (e) {
      rethrow;
    }
  }
}
`;
}
exports.getRepoRepoContent = (name, className) => {
return `
import '../../data/models/${name}.dart';

abstract class ${className}Repo {
  Future<${className}Model?> get${className}() async {}
}
`;
}