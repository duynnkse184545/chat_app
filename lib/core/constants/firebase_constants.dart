class FirebaseConstants {
  // Collection names
  static const String usersCollection = 'users';
  static const String serversCollection = 'servers';
  static const String channelsCollection = 'channels';
  static const String messagesCollection = 'messages';

  // Subcollection names
  static const String membersSubcollection = 'members';
  static const String channelsSubcollection = 'channels';

  // Storage paths
  static const String avatarsPath = 'avatars';
  static const String serverIconsPath = 'server_icons';

  // Field names (for queries)
  static const String createdAtField = 'createdAt';
  static const String memberIdsField = 'memberIds';
  static const String ownerIdField = 'ownerId';
  static const String authorIdField = 'authorId';
}