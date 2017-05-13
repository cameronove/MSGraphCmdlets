Class microsoft_graph_entity_v1_0 {
[object]$id;
[hashtable]$GraphAdditionalProperties = @{};
[string]$__Path;

Delete([bool]$force) {
    if(!$force) {
        $Result = Read-Host "Do you want to delete the object $($this.__Path)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        Invoke-GraphMethod -query "$($this.__Path)\$($this.id)" -Method 'Delete' -version 'v1.0'
    }
}

Delete([bool]$force, [string]$PathOverride) {
    if(!$force) {
        $Result = Read-Host "Do you want to delete the object $($PathOverride)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        Invoke-GraphMethod -query "$($PathOverride)\$($this.id)" -Method 'Delete' -version 'v1.0'
    }
}

[object] Set ([bool]$force, [hashtable]$PropertyHash) {
    if(!$force){
        $Result = Read-Host "Do you want to update the object $($this.__Path)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        foreach($key in $PropertyHash.keys) { 
            try{ $this."$key" = $PropertyHash[$key] }
            catch {  }
        }
        $BodyJSON = $PropertyHash | ConvertTo-Json -Depth 10
        return (Invoke-GraphMethod -method 'Patch' -query "$($this.__Path)\$($this.id)" -body $BodyJSON -ContentType 'application/json' -version 'v1.0')
    }
    else { return ' ' }
}

[object] Set ([bool]$force, [hashtable]$PropertyHash, [string]$PathOverride) {
    if(!$force){
        $Result = Read-Host "Do you want to update the object $($PathOverride)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        foreach($key in $PropertyHash.keys) { 
            try{ $this."$key" = $PropertyHash[$key] }
            catch {  }
        }
        $BodyJSON = $PropertyHash | ConvertTo-Json -Depth 10
        return (Invoke-GraphMethod -method 'Patch' -query "$($PathOverride)\$($this.id)" -body $BodyJSON -ContentType 'application/json' -version 'v1.0' )
    }
    else { return ' ' }
}

}

Class microsoft_graph_directoryObject_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_device_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$accountEnabled;
[object]$operatingSystem;
[object]$displayName;
[object]$operatingSystemVersion;
[object]$deviceVersion;
[object]$alternativeSecurityIds;
[object]$onPremisesLastSyncDateTime;
[object]$approximateLastSignInDateTime;
[object]$physicalIds;
[object]$isManaged;
[object]$deviceMetadata;
[object]$trustType;
[object]$deviceId;
[object]$onPremisesSyncEnabled;
[object]$isCompliant;

[object]Get_registeredOwners() { return (Invoke-GraphMethod -Version 'v1.0' -Query "devices/$($this.Id)/registeredOwners")  }

[object]Get_registeredUsers() { return (Invoke-GraphMethod -Version 'v1.0' -Query "devices/$($this.Id)/registeredUsers")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "devices/$($this.Id)/extensions")  }

}

Class microsoft_graph_extension_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_directoryRole_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$description;
[object]$displayName;
[object]$roleTemplateId;

[object]Get_members() { return (Invoke-GraphMethod -Version 'v1.0' -Query "directoryRoles/$($this.Id)/members")  }

}

Class microsoft_graph_directoryRoleTemplate_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$displayName;
[object]$description;

}

Class microsoft_graph_domain_v1_0 : microsoft_graph_entity_v1_0 {
[object]$isAdminManaged;
[object]$isInitial;
[object]$availabilityStatus;
[object]$supportedServices;
[object]$isRoot;
[object]$state;
[object]$authenticationType;
[object]$isVerified;
[object]$isDefault;

[object]Get_serviceConfigurationRecords() { return (Invoke-GraphMethod -Version 'v1.0' -Query "domains/$($this.Id)/serviceConfigurationRecords")  }

[object]Get_verificationDnsRecords() { return (Invoke-GraphMethod -Version 'v1.0' -Query "domains/$($this.Id)/verificationDnsRecords")  }

[object]Get_domainNameReferences() { return (Invoke-GraphMethod -Version 'v1.0' -Query "domains/$($this.Id)/domainNameReferences")  }

}

Class microsoft_graph_domainDnsRecord_v1_0 : microsoft_graph_entity_v1_0 {
[object]$label;
[object]$ttl;
[object]$isOptional;
[object]$supportedService;
[object]$recordType;

}

Class microsoft_graph_domainDnsCnameRecord_v1_0 : microsoft_graph_domainDnsRecord_v1_0 {
[object]$canonicalName;

}

Class microsoft_graph_domainDnsMxRecord_v1_0 : microsoft_graph_domainDnsRecord_v1_0 {
[object]$preference;
[object]$mailExchange;

}

Class microsoft_graph_domainDnsSrvRecord_v1_0 : microsoft_graph_domainDnsRecord_v1_0 {
[object]$weight;
[object]$nameTarget;
[object]$port;
[object]$service;
[object]$priority;
[object]$protocol;

}

Class microsoft_graph_domainDnsTxtRecord_v1_0 : microsoft_graph_domainDnsRecord_v1_0 {
[object]$text;

}

Class microsoft_graph_domainDnsUnavailableRecord_v1_0 : microsoft_graph_domainDnsRecord_v1_0 {
[object]$description;

}

Class microsoft_graph_licenseDetails_v1_0 : microsoft_graph_entity_v1_0 {
[object]$skuPartNumber;
[object]$skuId;
[object]$servicePlans;

}

Class microsoft_graph_group_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$onPremisesSyncEnabled;
[object]$description;
[object]$displayName;
[object]$allowExternalSenders;
[object]$unseenCount;
[object]$onPremisesSecurityIdentifier;
[object]$securityEnabled;
[object]$groupTypes;
[object]$proxyAddresses;
[object]$onPremisesLastSyncDateTime;
[object]$mail;
[object]$isSubscribedByMail;
[object]$visibility;
[object]$autoSubscribeNewMembers;
[object]$mailEnabled;
[object]$mailNickname;

[object]Get_members() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/members")  }

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/memberOf")  }

[object]Get_createdOnBehalfOf() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/createdOnBehalfOf")  }

[object]Get_owners() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/owners")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/extensions")  }

[object]Get_threads() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/threads")  }

[object]Get_calendar() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/calendar")  }

[object]Get_calendarView() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/calendarView")  }

[object]Get_events() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/events")  }

[object]Get_conversations() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/conversations")  }

[object]Get_photo() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/photo")  }

[object]Get_photos() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/photos")  }

[object]Get_acceptedSenders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/acceptedSenders")  }

[object]Get_rejectedSenders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/rejectedSenders")  }

[object]Get_drive() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/drive")  }

[object]Get_drives() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/drives")  }

[object]Get_sites() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/sites")  }

[object]Get_planner() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/planner")  }

[object]Get_onenote() { return (Invoke-GraphMethod -Version 'v1.0' -Query "groups/$($this.Id)/onenote")  }

}

Class microsoft_graph_conversationThread_v1_0 : microsoft_graph_entity_v1_0 {
[object]$lastDeliveredDateTime;
[object]$toRecipients;
[object]$hasAttachments;
[object]$isLocked;
[object]$topic;
[object]$uniqueSenders;
[object]$preview;
[object]$ccRecipients;

[object]Get_posts() { return (Invoke-GraphMethod -Version 'v1.0' -Query "conversationThreads/$($this.Id)/posts")  }

}

Class microsoft_graph_calendar_v1_0 : microsoft_graph_entity_v1_0 {
[object]$changeKey;
[object]$color;
[object]$name;

[object]Get_events() { return (Invoke-GraphMethod -Version 'v1.0' -Query "calendars/$($this.Id)/events")  }

[object]Get_calendarView() { return (Invoke-GraphMethod -Version 'v1.0' -Query "calendars/$($this.Id)/calendarView")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "calendars/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "calendars/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_outlookItem_v1_0 : microsoft_graph_entity_v1_0 {
[object]$changeKey;
[object]$lastModifiedDateTime;
[object]$createdDateTime;
[object]$categories;

}

Class microsoft_graph_event_v1_0 : microsoft_graph_outlookItem_v1_0 {
[object]$onlineMeetingUrl;
[object]$isReminderOn;
[object]$subject;
[object]$webLink;
[object]$originalStart;
[object]$isCancelled;
[object]$sensitivity;
[object]$start;
[object]$location;
[object]$attendees;
[object]$originalStartTimeZone;
[object]$responseStatus;
[object]$showAs;
[object]$isOrganizer;
[object]$originalEndTimeZone;
[object]$isAllDay;
[object]$end;
[object]$responseRequested;
[object]$bodyPreview;
[object]$recurrence;
[object]$hasAttachments;
[object]$body;
[object]$type;
[object]$importance;
[object]$seriesMasterId;
[object]$organizer;
[object]$iCalUId;
[object]$reminderMinutesBeforeStart;

[object]Get_calendar() { return (Invoke-GraphMethod -Version 'v1.0' -Query "events/$($this.Id)/calendar")  }

[object]Get_instances() { return (Invoke-GraphMethod -Version 'v1.0' -Query "events/$($this.Id)/instances")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "events/$($this.Id)/extensions")  }

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'v1.0' -Query "events/$($this.Id)/attachments")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "events/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "events/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_conversation_v1_0 : microsoft_graph_entity_v1_0 {
[object]$lastDeliveredDateTime;
[object]$preview;
[object]$uniqueSenders;
[object]$hasAttachments;
[object]$topic;

[object]Get_threads() { return (Invoke-GraphMethod -Version 'v1.0' -Query "conversations/$($this.Id)/threads")  }

}

Class microsoft_graph_profilePhoto_v1_0 : microsoft_graph_entity_v1_0 {
[object]$height;
[object]$width;

}

Class microsoft_graph_baseItem_v1_0 : microsoft_graph_entity_v1_0 {
[object]$lastModifiedDateTime;
[object]$description;
[object]$createdBy;
[object]$lastModifiedBy;
[object]$eTag;
[object]$name;
[object]$createdDateTime;
[object]$parentReference;
[object]$webUrl;

[object]Get_createdByUser() { return (Invoke-GraphMethod -Version 'v1.0' -Query "baseItems/$($this.Id)/createdByUser")  }

[object]Get_lastModifiedByUser() { return (Invoke-GraphMethod -Version 'v1.0' -Query "baseItems/$($this.Id)/lastModifiedByUser")  }

}

Class microsoft_graph_drive_v1_0 : microsoft_graph_baseItem_v1_0 {
[object]$sharePointIds;
[object]$driveType;
[object]$quota;
[object]$owner;

[object]Get_items() { return (Invoke-GraphMethod -Version 'v1.0' -Query "drives/$($this.Id)/items")  }

[object]Get_root() { return (Invoke-GraphMethod -Version 'v1.0' -Query "drives/$($this.Id)/root")  }

[object]Get_special() { return (Invoke-GraphMethod -Version 'v1.0' -Query "drives/$($this.Id)/special")  }

}

Class microsoft_graph_site_v1_0 : microsoft_graph_baseItem_v1_0 {
[object]$sharepointIds;
[object]$root;
[object]$displayName;
[object]$siteCollection;

[object]Get_drive() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sites/$($this.Id)/drive")  }

[object]Get_drives() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sites/$($this.Id)/drives")  }

[object]Get_sites() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sites/$($this.Id)/sites")  }

}

Class microsoft_graph_plannerGroup_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_plans() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerGroups/$($this.Id)/plans")  }

}

Class microsoft_graph_onenote_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_notebooks() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotes/$($this.Id)/notebooks")  }

[object]Get_sections() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotes/$($this.Id)/sections")  }

[object]Get_sectionGroups() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotes/$($this.Id)/sectionGroups")  }

[object]Get_pages() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotes/$($this.Id)/pages")  }

[object]Get_resources() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotes/$($this.Id)/resources")  }

[object]Get_operations() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotes/$($this.Id)/operations")  }

}

Class microsoft_graph_contract_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$contractType;
[object]$customerId;
[object]$displayName;
[object]$defaultDomainName;

}

Class microsoft_graph_subscribedSku_v1_0 : microsoft_graph_entity_v1_0 {
[object]$skuPartNumber;
[object]$appliesTo;
[object]$prepaidUnits;
[object]$skuId;
[object]$servicePlans;
[object]$capabilityStatus;
[object]$consumedUnits;

}

Class microsoft_graph_organization_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$onPremisesSyncEnabled;
[object]$country;
[object]$verifiedDomains;
[object]$displayName;
[object]$assignedPlans;
[object]$securityComplianceNotificationPhones;
[object]$marketingNotificationEmails;
[object]$businessPhones;
[object]$street;
[object]$onPremisesLastSyncDateTime;
[object]$technicalNotificationMails;
[object]$countryLetterCode;
[object]$preferredLanguage;
[object]$state;
[object]$provisionedPlans;
[object]$city;
[object]$postalCode;
[object]$securityComplianceNotificationMails;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "organizations/$($this.Id)/extensions")  }

}

Class microsoft_graph_user_v1_0 : microsoft_graph_directoryObject_v1_0 {
[object]$postalCode;
[object]$preferredName;
[object]$accountEnabled;
[object]$mailNickname;
[object]$imAddresses;
[object]$department;
[object]$interests;
[object]$displayName;
[object]$jobTitle;
[object]$officeLocation;
[object]$passwordPolicies;
[object]$birthday;
[object]$mailboxSettings;
[object]$userType;
[object]$preferredLanguage;
[object]$state;
[object]$mobilePhone;
[object]$mySite;
[object]$responsibilities;
[object]$assignedPlans;
[object]$assignedLicenses;
[object]$schools;
[object]$country;
[object]$givenName;
[object]$passwordProfile;
[object]$pastProjects;
[object]$aboutMe;
[object]$hireDate;
[object]$streetAddress;
[object]$city;
[object]$proxyAddresses;
[object]$onPremisesImmutableId;
[object]$provisionedPlans;
[object]$companyName;
[object]$usageLocation;
[object]$surname;
[object]$userPrincipalName;
[object]$mail;
[object]$businessPhones;
[object]$onPremisesSyncEnabled;
[object]$skills;
[object]$onPremisesSecurityIdentifier;
[object]$onPremisesLastSyncDateTime;

[object]Get_ownedDevices() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/ownedDevices")  }

[object]Get_registeredDevices() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/registeredDevices")  }

[object]Get_manager() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/manager")  }

[object]Get_directReports() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/directReports")  }

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/memberOf")  }

[object]Get_createdObjects() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/createdObjects")  }

[object]Get_ownedObjects() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/ownedObjects")  }

[object]Get_licenseDetails() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/licenseDetails")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/extensions")  }

[object]Get_messages() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/messages")  }

[object]Get_mailFolders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/mailFolders")  }

[object]Get_calendar() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/calendar")  }

[object]Get_calendars() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/calendars")  }

[object]Get_calendarGroups() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/calendarGroups")  }

[object]Get_calendarView() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/calendarView")  }

[object]Get_events() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/events")  }

[object]Get_contacts() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/contacts")  }

[object]Get_contactFolders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/contactFolders")  }

[object]Get_inferenceClassification() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/inferenceClassification")  }

[object]Get_photo() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/photo")  }

[object]Get_photos() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/photos")  }

[object]Get_drive() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/drive")  }

[object]Get_drives() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/drives")  }

[object]Get_planner() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/planner")  }

[object]Get_onenote() { return (Invoke-GraphMethod -Version 'v1.0' -Query "users/$($this.Id)/onenote")  }

}

Class microsoft_graph_message_v1_0 : microsoft_graph_outlookItem_v1_0 {
[object]$internetMessageId;
[object]$uniqueBody;
[object]$body;
[object]$subject;
[object]$importance;
[object]$isDraft;
[object]$conversationId;
[object]$sentDateTime;
[object]$bccRecipients;
[object]$isRead;
[object]$isReadReceiptRequested;
[object]$isDeliveryReceiptRequested;
[object]$replyTo;
[object]$sender;
[object]$webLink;
[object]$ccRecipients;
[object]$bodyPreview;
[object]$hasAttachments;
[object]$inferenceClassification;
[object]$from;
[object]$receivedDateTime;
[object]$parentFolderId;
[object]$toRecipients;

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'v1.0' -Query "messages/$($this.Id)/attachments")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "messages/$($this.Id)/extensions")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "messages/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "messages/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_mailFolder_v1_0 : microsoft_graph_entity_v1_0 {
[object]$totalItemCount;
[object]$childFolderCount;
[object]$displayName;
[object]$parentFolderId;
[object]$unreadItemCount;

[object]Get_messages() { return (Invoke-GraphMethod -Version 'v1.0' -Query "mailFolders/$($this.Id)/messages")  }

[object]Get_childFolders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "mailFolders/$($this.Id)/childFolders")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "mailFolders/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "mailFolders/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_calendarGroup_v1_0 : microsoft_graph_entity_v1_0 {
[object]$changeKey;
[object]$classId;
[object]$name;

[object]Get_calendars() { return (Invoke-GraphMethod -Version 'v1.0' -Query "calendarGroups/$($this.Id)/calendars")  }

}

Class microsoft_graph_contact_v1_0 : microsoft_graph_outlookItem_v1_0 {
[object]$middleName;
[object]$yomiCompanyName;
[object]$generation;
[object]$businessAddress;
[object]$imAddresses;
[object]$department;
[object]$yomiSurname;
[object]$displayName;
[object]$jobTitle;
[object]$nickName;
[object]$businessHomePage;
[object]$birthday;
[object]$fileAs;
[object]$otherAddress;
[object]$homeAddress;
[object]$mobilePhone;
[object]$givenName;
[object]$title;
[object]$assistantName;
[object]$personalNotes;
[object]$profession;
[object]$homePhones;
[object]$initials;
[object]$surname;
[object]$spouseName;
[object]$manager;
[object]$children;
[object]$officeLocation;
[object]$parentFolderId;
[object]$companyName;
[object]$businessPhones;
[object]$emailAddresses;
[object]$yomiGivenName;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contacts/$($this.Id)/extensions")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contacts/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contacts/$($this.Id)/multiValueExtendedProperties")  }

[object]Get_photo() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contacts/$($this.Id)/photo")  }

}

Class microsoft_graph_contactFolder_v1_0 : microsoft_graph_entity_v1_0 {
[object]$parentFolderId;
[object]$displayName;

[object]Get_contacts() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contactFolders/$($this.Id)/contacts")  }

[object]Get_childFolders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contactFolders/$($this.Id)/childFolders")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contactFolders/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "contactFolders/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_inferenceClassification_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_overrides() { return (Invoke-GraphMethod -Version 'v1.0' -Query "inferenceClassifications/$($this.Id)/overrides")  }

}

Class microsoft_graph_plannerUser_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerUsers/$($this.Id)/tasks")  }

[object]Get_plans() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerUsers/$($this.Id)/plans")  }

}

Class microsoft_graph_schemaExtension_v1_0 : microsoft_graph_entity_v1_0 {
[object]$targetTypes;
[object]$description;
[object]$status;
[object]$properties;
[object]$owner;

}

Class microsoft_graph_attachment_v1_0 : microsoft_graph_entity_v1_0 {
[object]$contentType;
[object]$lastModifiedDateTime;
[object]$isInline;
[object]$name;
[object]$size;

}

Class microsoft_graph_singleValueLegacyExtendedProperty_v1_0 : microsoft_graph_entity_v1_0 {
[object]$value;

}

Class microsoft_graph_multiValueLegacyExtendedProperty_v1_0 : microsoft_graph_entity_v1_0 {
[object]$value;

}

Class microsoft_graph_fileAttachment_v1_0 : microsoft_graph_attachment_v1_0 {
[object]$contentId;
[object]$contentLocation;
[object]$contentBytes;

}

Class microsoft_graph_itemAttachment_v1_0 : microsoft_graph_attachment_v1_0 {

[object]Get_item() { return (Invoke-GraphMethod -Version 'v1.0' -Query "itemAttachments/$($this.Id)/item")  }

}

Class microsoft_graph_eventMessage_v1_0 : microsoft_graph_message_v1_0 {
[object]$meetingMessageType;

[object]Get_event() { return (Invoke-GraphMethod -Version 'v1.0' -Query "eventMessages/$($this.Id)/event")  }

}

Class microsoft_graph_referenceAttachment_v1_0 : microsoft_graph_attachment_v1_0 {

}

Class microsoft_graph_openTypeExtension_v1_0 : microsoft_graph_extension_v1_0 {
[object]$extensionName;

}

Class microsoft_graph_post_v1_0 : microsoft_graph_outlookItem_v1_0 {
[object]$hasAttachments;
[object]$receivedDateTime;
[object]$conversationThreadId;
[object]$sender;
[object]$newParticipants;
[object]$body;
[object]$from;
[object]$conversationId;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "posts/$($this.Id)/extensions")  }

[object]Get_inReplyTo() { return (Invoke-GraphMethod -Version 'v1.0' -Query "posts/$($this.Id)/inReplyTo")  }

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'v1.0' -Query "posts/$($this.Id)/attachments")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "posts/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'v1.0' -Query "posts/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_inferenceClassificationOverride_v1_0 : microsoft_graph_entity_v1_0 {
[object]$senderEmailAddress;
[object]$classifyAs;

}

Class microsoft_graph_driveItem_v1_0 : microsoft_graph_baseItem_v1_0 {
[object]$shared;
[object]$photo;
[object]$cTag;
[object]$folder;
[object]$deleted;
[object]$sharepointIds;
[object]$searchResult;
[object]$image;
[object]$file;
[object]$root;
[object]$package;
[object]$webDavUrl;
[object]$audio;
[object]$content;
[object]$size;
[object]$video;
[object]$fileSystemInfo;
[object]$location;
[object]$specialFolder;
[object]$remoteItem;

[object]Get_children() { return (Invoke-GraphMethod -Version 'v1.0' -Query "driveItems/$($this.Id)/children")  }

[object]Get_permissions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "driveItems/$($this.Id)/permissions")  }

[object]Get_thumbnails() { return (Invoke-GraphMethod -Version 'v1.0' -Query "driveItems/$($this.Id)/thumbnails")  }

[object]Get_workbook() { return (Invoke-GraphMethod -Version 'v1.0' -Query "driveItems/$($this.Id)/workbook")  }

}

Class microsoft_graph_permission_v1_0 : microsoft_graph_entity_v1_0 {
[object]$link;
[object]$roles;
[object]$shareId;
[object]$inheritedFrom;
[object]$grantedTo;
[object]$invitation;

}

Class microsoft_graph_thumbnailSet_v1_0 : microsoft_graph_entity_v1_0 {
[object]$source;
[object]$large;
[object]$small;
[object]$medium;

}

Class microsoft_graph_workbook_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_application() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbooks/$($this.Id)/application")  }

[object]Get_names() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbooks/$($this.Id)/names")  }

[object]Get_tables() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbooks/$($this.Id)/tables")  }

[object]Get_worksheets() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbooks/$($this.Id)/worksheets")  }

[object]Get_functions() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbooks/$($this.Id)/functions")  }

}

Class microsoft_graph_sharedDriveItem_v1_0 : microsoft_graph_baseItem_v1_0 {
[object]$name;
[object]$owner;

[object]Get_driveItem() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sharedDriveItems/$($this.Id)/driveItem")  }

[object]Get_items() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sharedDriveItems/$($this.Id)/items")  }

[object]Get_root() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sharedDriveItems/$($this.Id)/root")  }

[object]Get_site() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sharedDriveItems/$($this.Id)/site")  }

}

Class microsoft_graph_sharePoint_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_list_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_workbookApplication_v1_0 : microsoft_graph_entity_v1_0 {
[object]$calculationMode;

}

Class microsoft_graph_workbookNamedItem_v1_0 : microsoft_graph_entity_v1_0 {
[object]$comment;
[object]$type;
[object]$visible;
[object]$value;
[object]$name;
[object]$scope;

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookNamedItems/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookTable_v1_0 : microsoft_graph_entity_v1_0 {
[object]$showBandedColumns;
[object]$showTotals;
[object]$showBandedRows;
[object]$showFilterButton;
[object]$name;
[object]$showHeaders;
[object]$highlightFirstColumn;
[object]$style;
[object]$highlightLastColumn;

[object]Get_columns() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookTables/$($this.Id)/columns")  }

[object]Get_rows() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookTables/$($this.Id)/rows")  }

[object]Get_sort() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookTables/$($this.Id)/sort")  }

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookTables/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookWorksheet_v1_0 : microsoft_graph_entity_v1_0 {
[object]$position;
[object]$visibility;
[object]$name;

[object]Get_charts() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookWorksheets/$($this.Id)/charts")  }

[object]Get_names() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookWorksheets/$($this.Id)/names")  }

[object]Get_pivotTables() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookWorksheets/$($this.Id)/pivotTables")  }

[object]Get_protection() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookWorksheets/$($this.Id)/protection")  }

[object]Get_tables() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookWorksheets/$($this.Id)/tables")  }

}

Class microsoft_graph_workbookFunctions_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_workbookChart_v1_0 : microsoft_graph_entity_v1_0 {
[object]$left;
[object]$width;
[object]$name;
[object]$height;
[object]$top;

[object]Get_axes() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/axes")  }

[object]Get_dataLabels() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/dataLabels")  }

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/format")  }

[object]Get_legend() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/legend")  }

[object]Get_series() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/series")  }

[object]Get_title() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/title")  }

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookCharts/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookChartAxes_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_categoryAxis() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxess/$($this.Id)/categoryAxis")  }

[object]Get_seriesAxis() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxess/$($this.Id)/seriesAxis")  }

[object]Get_valueAxis() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxess/$($this.Id)/valueAxis")  }

}

Class microsoft_graph_workbookChartDataLabels_v1_0 : microsoft_graph_entity_v1_0 {
[object]$position;
[object]$showLegendKey;
[object]$showSeriesName;
[object]$showPercentage;
[object]$separator;
[object]$showBubbleSize;
[object]$showValue;
[object]$showCategoryName;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartDataLabelss/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartAreaFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAreaFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAreaFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartLegend_v1_0 : microsoft_graph_entity_v1_0 {
[object]$position;
[object]$overlay;
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartLegends/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartSeries_v1_0 : microsoft_graph_entity_v1_0 {
[object]$name;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartSeriess/$($this.Id)/format")  }

[object]Get_points() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartSeriess/$($this.Id)/points")  }

}

Class microsoft_graph_workbookChartTitle_v1_0 : microsoft_graph_entity_v1_0 {
[object]$overlay;
[object]$text;
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartTitles/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartFill_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_workbookChartFont_v1_0 : microsoft_graph_entity_v1_0 {
[object]$underline;
[object]$italic;
[object]$color;
[object]$name;
[object]$size;
[object]$bold;

}

Class microsoft_graph_workbookChartAxis_v1_0 : microsoft_graph_entity_v1_0 {
[object]$minimum;
[object]$majorUnit;
[object]$minorUnit;
[object]$maximum;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxiss/$($this.Id)/format")  }

[object]Get_majorGridlines() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxiss/$($this.Id)/majorGridlines")  }

[object]Get_minorGridlines() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxiss/$($this.Id)/minorGridlines")  }

[object]Get_title() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxiss/$($this.Id)/title")  }

}

Class microsoft_graph_workbookChartAxisFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxisFormats/$($this.Id)/font")  }

[object]Get_line() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxisFormats/$($this.Id)/line")  }

}

Class microsoft_graph_workbookChartGridlines_v1_0 : microsoft_graph_entity_v1_0 {
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartGridliness/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartAxisTitle_v1_0 : microsoft_graph_entity_v1_0 {
[object]$text;
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxisTitles/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartLineFormat_v1_0 : microsoft_graph_entity_v1_0 {
[object]$color;

}

Class microsoft_graph_workbookChartAxisTitleFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartAxisTitleFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartDataLabelFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartDataLabelFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartDataLabelFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartGridlinesFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_line() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartGridlinesFormats/$($this.Id)/line")  }

}

Class microsoft_graph_workbookChartLegendFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartLegendFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartLegendFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartPoint_v1_0 : microsoft_graph_entity_v1_0 {
[object]$value;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartPoints/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartPointFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartPointFormats/$($this.Id)/fill")  }

}

Class microsoft_graph_workbookChartSeriesFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartSeriesFormats/$($this.Id)/fill")  }

[object]Get_line() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartSeriesFormats/$($this.Id)/line")  }

}

Class microsoft_graph_workbookChartTitleFormat_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartTitleFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookChartTitleFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookFilter_v1_0 : microsoft_graph_entity_v1_0 {
[object]$criteria;

}

Class microsoft_graph_workbookFormatProtection_v1_0 : microsoft_graph_entity_v1_0 {
[object]$formulaHidden;
[object]$locked;

}

Class microsoft_graph_workbookFunctionResult_v1_0 : microsoft_graph_entity_v1_0 {
[object]$error;
[object]$value;

}

Class microsoft_graph_workbookPivotTable_v1_0 : microsoft_graph_entity_v1_0 {
[object]$name;

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookPivotTables/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookRange_v1_0 : microsoft_graph_entity_v1_0 {
[object]$cellCount;
[object]$columnHidden;
[object]$addressLocal;
[object]$rowIndex;
[object]$rowHidden;
[object]$valueTypes;
[object]$values;
[object]$hidden;
[object]$formulasR1C1;
[object]$address;
[object]$columnIndex;
[object]$formulas;
[object]$numberFormat;
[object]$formulasLocal;
[object]$columnCount;
[object]$text;
[object]$rowCount;

[object]Get_format() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRanges/$($this.Id)/format")  }

[object]Get_sort() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRanges/$($this.Id)/sort")  }

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRanges/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookRangeFormat_v1_0 : microsoft_graph_entity_v1_0 {
[object]$verticalAlignment;
[object]$horizontalAlignment;
[object]$columnWidth;
[object]$rowHeight;
[object]$wrapText;

[object]Get_borders() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRangeFormats/$($this.Id)/borders")  }

[object]Get_fill() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRangeFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRangeFormats/$($this.Id)/font")  }

[object]Get_protection() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRangeFormats/$($this.Id)/protection")  }

}

Class microsoft_graph_workbookRangeSort_v1_0 : microsoft_graph_entity_v1_0 {

}

Class microsoft_graph_workbookRangeBorder_v1_0 : microsoft_graph_entity_v1_0 {
[object]$sideIndex;
[object]$color;
[object]$style;
[object]$weight;

}

Class microsoft_graph_workbookRangeFill_v1_0 : microsoft_graph_entity_v1_0 {
[object]$color;

}

Class microsoft_graph_workbookRangeFont_v1_0 : microsoft_graph_entity_v1_0 {
[object]$underline;
[object]$italic;
[object]$color;
[object]$name;
[object]$size;
[object]$bold;

}

Class microsoft_graph_workbookRangeView_v1_0 : microsoft_graph_entity_v1_0 {
[object]$numberFormat;
[object]$text;
[object]$cellAddresses;
[object]$formulas;
[object]$formulasLocal;
[object]$rowCount;
[object]$index;
[object]$values;
[object]$valueTypes;
[object]$formulasR1C1;
[object]$columnCount;

[object]Get_rows() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookRangeViews/$($this.Id)/rows")  }

}

Class microsoft_graph_workbookTableColumn_v1_0 : microsoft_graph_entity_v1_0 {
[object]$values;
[object]$name;
[object]$index;

[object]Get_filter() { return (Invoke-GraphMethod -Version 'v1.0' -Query "workbookTableColumns/$($this.Id)/filter")  }

}

Class microsoft_graph_workbookTableRow_v1_0 : microsoft_graph_entity_v1_0 {
[object]$values;
[object]$index;

}

Class microsoft_graph_workbookTableSort_v1_0 : microsoft_graph_entity_v1_0 {
[object]$method;
[object]$fields;
[object]$matchCase;

}

Class microsoft_graph_workbookWorksheetProtection_v1_0 : microsoft_graph_entity_v1_0 {
[object]$options;
[object]$protected;

}

Class microsoft_graph_subscription_v1_0 : microsoft_graph_entity_v1_0 {
[object]$clientState;
[object]$resource;
[object]$changeType;
[object]$expirationDateTime;
[object]$notificationUrl;

}

Class microsoft_graph_invitation_v1_0 : microsoft_graph_entity_v1_0 {
[object]$invitedUserMessageInfo;
[object]$invitedUserType;
[object]$sendInvitationMessage;
[object]$invitedUserEmailAddress;
[object]$inviteRedeemUrl;
[object]$invitedUserDisplayName;
[object]$status;
[object]$inviteRedirectUrl;

[object]Get_invitedUser() { return (Invoke-GraphMethod -Version 'v1.0' -Query "invitations/$($this.Id)/invitedUser")  }

}

Class microsoft_graph_plannerTask_v1_0 : microsoft_graph_entity_v1_0 {
[object]$planId;
[object]$startDateTime;
[object]$activeChecklistItemCount;
[object]$bucketId;
[object]$completedDateTime;
[object]$appliedCategories;
[object]$createdDateTime;
[object]$hasDescription;
[object]$assigneePriority;
[object]$percentComplete;
[object]$title;
[object]$dueDateTime;
[object]$completedBy;
[object]$referenceCount;
[object]$orderHint;
[object]$assignments;
[object]$previewType;
[object]$checklistItemCount;
[object]$conversationThreadId;
[object]$createdBy;

[object]Get_details() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerTasks/$($this.Id)/details")  }

[object]Get_assignedToTaskBoardFormat() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerTasks/$($this.Id)/assignedToTaskBoardFormat")  }

[object]Get_progressTaskBoardFormat() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerTasks/$($this.Id)/progressTaskBoardFormat")  }

[object]Get_bucketTaskBoardFormat() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerTasks/$($this.Id)/bucketTaskBoardFormat")  }

}

Class microsoft_graph_plannerPlan_v1_0 : microsoft_graph_entity_v1_0 {
[object]$createdBy;
[object]$title;
[object]$createdDateTime;
[object]$owner;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerPlans/$($this.Id)/tasks")  }

[object]Get_buckets() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerPlans/$($this.Id)/buckets")  }

[object]Get_details() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerPlans/$($this.Id)/details")  }

}

Class microsoft_graph_planner_v1_0 : microsoft_graph_entity_v1_0 {

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'v1.0' -Query "planners/$($this.Id)/tasks")  }

[object]Get_plans() { return (Invoke-GraphMethod -Version 'v1.0' -Query "planners/$($this.Id)/plans")  }

[object]Get_buckets() { return (Invoke-GraphMethod -Version 'v1.0' -Query "planners/$($this.Id)/buckets")  }

}

Class microsoft_graph_plannerBucket_v1_0 : microsoft_graph_entity_v1_0 {
[object]$orderHint;
[object]$name;
[object]$planId;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'v1.0' -Query "plannerBuckets/$($this.Id)/tasks")  }

}

Class microsoft_graph_plannerTaskDetails_v1_0 : microsoft_graph_entity_v1_0 {
[object]$checklist;
[object]$description;
[object]$previewType;
[object]$references;

}

Class microsoft_graph_plannerAssignedToTaskBoardTaskFormat_v1_0 : microsoft_graph_entity_v1_0 {
[object]$unassignedOrderHint;
[object]$orderHintsByAssignee;

}

Class microsoft_graph_plannerProgressTaskBoardTaskFormat_v1_0 : microsoft_graph_entity_v1_0 {
[object]$orderHint;

}

Class microsoft_graph_plannerBucketTaskBoardTaskFormat_v1_0 : microsoft_graph_entity_v1_0 {
[object]$orderHint;

}

Class microsoft_graph_plannerPlanDetails_v1_0 : microsoft_graph_entity_v1_0 {
[object]$sharedWith;
[object]$categoryDescriptions;

}

Class microsoft_graph_onenoteEntityBaseModel_v1_0 : microsoft_graph_entity_v1_0 {
[object]$self;

}

Class microsoft_graph_onenoteEntitySchemaObjectModel_v1_0 : microsoft_graph_onenoteEntityBaseModel_v1_0 {
[object]$createdDateTime;

}

Class microsoft_graph_onenoteEntityHierarchyModel_v1_0 : microsoft_graph_onenoteEntitySchemaObjectModel_v1_0 {
[object]$createdBy;
[object]$lastModifiedDateTime;
[object]$displayName;
[object]$lastModifiedBy;

}

Class microsoft_graph_notebook_v1_0 : microsoft_graph_onenoteEntityHierarchyModel_v1_0 {
[object]$isShared;
[object]$sectionGroupsUrl;
[object]$sectionsUrl;
[object]$userRole;
[object]$links;
[object]$isDefault;

[object]Get_sections() { return (Invoke-GraphMethod -Version 'v1.0' -Query "notebooks/$($this.Id)/sections")  }

[object]Get_sectionGroups() { return (Invoke-GraphMethod -Version 'v1.0' -Query "notebooks/$($this.Id)/sectionGroups")  }

}

Class microsoft_graph_onenoteSection_v1_0 : microsoft_graph_onenoteEntityHierarchyModel_v1_0 {
[object]$links;
[object]$isDefault;
[object]$pagesUrl;

[object]Get_parentNotebook() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenoteSections/$($this.Id)/parentNotebook")  }

[object]Get_parentSectionGroup() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenoteSections/$($this.Id)/parentSectionGroup")  }

[object]Get_pages() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenoteSections/$($this.Id)/pages")  }

}

Class microsoft_graph_sectionGroup_v1_0 : microsoft_graph_onenoteEntityHierarchyModel_v1_0 {
[object]$sectionGroupsUrl;
[object]$sectionsUrl;

[object]Get_parentNotebook() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sectionGroups/$($this.Id)/parentNotebook")  }

[object]Get_parentSectionGroup() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sectionGroups/$($this.Id)/parentSectionGroup")  }

[object]Get_sections() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sectionGroups/$($this.Id)/sections")  }

[object]Get_sectionGroups() { return (Invoke-GraphMethod -Version 'v1.0' -Query "sectionGroups/$($this.Id)/sectionGroups")  }

}

Class microsoft_graph_onenotePage_v1_0 : microsoft_graph_onenoteEntitySchemaObjectModel_v1_0 {
[object]$contentUrl;
[object]$userTags;
[object]$createdByAppId;
[object]$content;
[object]$level;
[object]$links;
[object]$lastModifiedDateTime;
[object]$order;
[object]$title;

[object]Get_parentSection() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotePages/$($this.Id)/parentSection")  }

[object]Get_parentNotebook() { return (Invoke-GraphMethod -Version 'v1.0' -Query "onenotePages/$($this.Id)/parentNotebook")  }

}

Class microsoft_graph_onenoteResource_v1_0 : microsoft_graph_onenoteEntityBaseModel_v1_0 {
[object]$content;
[object]$contentUrl;

}

Class microsoft_graph_operation_v1_0 : microsoft_graph_entity_v1_0 {
[object]$status;
[object]$lastActionDateTime;
[object]$createdDateTime;

}

Class microsoft_graph_onenoteOperation_v1_0 : microsoft_graph_operation_v1_0 {
[object]$resourceId;
[object]$error;
[object]$percentComplete;
[object]$resourceLocation;

}

Class microsoft_graph_entity_beta {
[object]$id;
[hashtable]$GraphAdditionalProperties = @{};
[string]$__Path;
Delete([bool]$force) {
    if(!$force) {
        $Result = Read-Host "Do you want to delete the object $($this.__Path)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        Invoke-GraphMethod -query "$($this.__Path)\$($this.id)" -Method 'Delete' -version 'beta'
    }
}
Delete([bool]$force, [string]$PathOverride) {
    if(!$force) {
        $Result = Read-Host "Do you want to delete the object $($PathOverride)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        Invoke-GraphMethod -query "$($PathOverride)\$($this.id)" -Method 'Delete' -version 'beta'
    }
}

[object] Set ([bool]$force, [hashtable]$PropertyHash) {
    if(!$force){
        $Result = Read-Host "Do you want to update the object $($this.__Path)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        foreach($key in $PropertyHash.keys) { 
            try{ $this."$key" = $PropertyHash[$key] }
            catch {  }
        }
        $BodyJSON = $PropertyHash | ConvertTo-Json -Depth 10
        return (Invoke-GraphMethod -method 'Patch' -query "$($this.__Path)\$($this.id)" -body $BodyJSON -ContentType 'application/json' -version 'beta')
    }
    else { return ' ' }
}

[object] Set ([bool]$force, [hashtable]$PropertyHash, [string]$PathOverride) {
    if(!$force){
        $Result = Read-Host "Do you want to update the object $($PathOverride)\$($this.id)? (y/n)"
        if($result -eq 'y') { $force = $true }
    }
    if($force) {
        foreach($key in $PropertyHash.keys) { 
            try{ $this."$key" = $PropertyHash[$key] }
            catch {  }
        }
        $BodyJSON = $PropertyHash | ConvertTo-Json -Depth 10
        return (Invoke-GraphMethod -method 'Patch' -query "$($PathOverride)\$($this.id)" -body $BodyJSON -ContentType 'application/json' -version 'beta' )
    }
    else { return ' ' }
}
}

Class microsoft_graph_extension_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_directoryObject_beta : microsoft_graph_entity_beta {
[object]$deletedDateTime;

}

Class microsoft_graph_user_beta : microsoft_graph_directoryObject_beta {
[object]$postalCode;
[object]$showInAddressList;
[object]$accountEnabled;
[object]$mailNickname;
[object]$imAddresses;
[object]$department;
[object]$interests;
[object]$displayName;
[object]$jobTitle;
[object]$officeLocation;
[object]$passwordPolicies;
[object]$birthday;
[object]$mailboxSettings;
[object]$userType;
[object]$identityUserRisk;
[object]$onPremisesProvisioningErrors;
[object]$preferredLanguage;
[object]$state;
[object]$mobilePhone;
[object]$mySite;
[object]$responsibilities;
[object]$assignedPlans;
[object]$assignedLicenses;
[object]$schools;
[object]$country;
[object]$givenName;
[object]$passwordProfile;
[object]$pastProjects;
[object]$aboutMe;
[object]$hireDate;
[object]$streetAddress;
[object]$refreshTokensValidFromDateTime;
[object]$city;
[object]$preferredName;
[object]$onPremisesDomainName;
[object]$proxyAddresses;
[object]$onPremisesImmutableId;
[object]$provisionedPlans;
[object]$companyName;
[object]$onPremisesUserPrincipalName;
[object]$usageLocation;
[object]$surname;
[object]$userPrincipalName;
[object]$mail;
[object]$businessPhones;
[object]$deviceEnrollmentLimit;
[object]$onPremisesSyncEnabled;
[object]$onPremisesSamAccountName;
[object]$skills;
[object]$onPremisesSecurityIdentifier;
[object]$onPremisesLastSyncDateTime;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/extensions")  }

[object]Get_ownedDevices() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/ownedDevices")  }

[object]Get_registeredDevices() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/registeredDevices")  }

[object]Get_manager() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/manager")  }

[object]Get_directReports() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/directReports")  }

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/memberOf")  }

[object]Get_createdObjects() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/createdObjects")  }

[object]Get_ownedObjects() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/ownedObjects")  }

[object]Get_scopedRoleMemberOf() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/scopedRoleMemberOf")  }

[object]Get_licenseDetails() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/licenseDetails")  }

[object]Get_outlook() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/outlook")  }

[object]Get_messages() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/messages")  }

[object]Get_joinedGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/joinedGroups")  }

[object]Get_mailFolders() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/mailFolders")  }

[object]Get_calendar() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/calendar")  }

[object]Get_calendars() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/calendars")  }

[object]Get_calendarGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/calendarGroups")  }

[object]Get_calendarView() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/calendarView")  }

[object]Get_events() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/events")  }

[object]Get_people() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/people")  }

[object]Get_contacts() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/contacts")  }

[object]Get_contactFolders() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/contactFolders")  }

[object]Get_inferenceClassification() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/inferenceClassification")  }

[object]Get_photo() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/photo")  }

[object]Get_photos() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/photos")  }

[object]Get_drive() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/drive")  }

[object]Get_drives() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/drives")  }

[object]Get_insights() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/insights")  }

[object]Get_trendingAround() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/trendingAround")  }

[object]Get_workingWith() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/workingWith")  }

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/tasks")  }

[object]Get_plans() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/plans")  }

[object]Get_planner() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/planner")  }

[object]Get_onenote() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/onenote")  }

[object]Get_managedDevices() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/managedDevices")  }

[object]Get_managedAppRegistrations() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/managedAppRegistrations")  }

[object]Get_devices() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/devices")  }

[object]Get_joinedTeams() { return (Invoke-GraphMethod -Version 'beta' -Query "users/$($this.Id)/joinedTeams")  }

}

Class microsoft_graph_scopedRoleMembership_beta : microsoft_graph_entity_beta {
[object]$roleMemberInfo;
[object]$administrativeUnitId;
[object]$roleId;

}

Class microsoft_graph_licenseDetails_beta : microsoft_graph_entity_beta {
[object]$skuPartNumber;
[object]$skuId;
[object]$servicePlans;

}

Class microsoft_graph_outlookUser_beta : microsoft_graph_entity_beta {

[object]Get_taskGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookUsers/$($this.Id)/taskGroups")  }

[object]Get_taskFolders() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookUsers/$($this.Id)/taskFolders")  }

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookUsers/$($this.Id)/tasks")  }

}

Class microsoft_graph_outlookItem_beta : microsoft_graph_entity_beta {
[object]$changeKey;
[object]$lastModifiedDateTime;
[object]$createdDateTime;
[object]$categories;

}

Class microsoft_graph_message_beta : microsoft_graph_outlookItem_beta {
[object]$sender;
[object]$unsubscribeEnabled;
[object]$mentionsPreview;
[object]$webLink;
[object]$isRead;
[object]$inferenceClassification;
[object]$subject;
[object]$uniqueBody;
[object]$bccRecipients;
[object]$receivedDateTime;
[object]$isDeliveryReceiptRequested;
[object]$internetMessageId;
[object]$toRecipients;
[object]$ccRecipients;
[object]$conversationIndex;
[object]$isDraft;
[object]$from;
[object]$bodyPreview;
[object]$sentDateTime;
[object]$hasAttachments;
[object]$replyTo;
[object]$body;
[object]$unsubscribeData;
[object]$importance;
[object]$parentFolderId;
[object]$isReadReceiptRequested;
[object]$conversationId;
[object]$flag;

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'beta' -Query "messages/$($this.Id)/attachments")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "messages/$($this.Id)/extensions")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "messages/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "messages/$($this.Id)/multiValueExtendedProperties")  }

[object]Get_mentions() { return (Invoke-GraphMethod -Version 'beta' -Query "messages/$($this.Id)/mentions")  }

}

Class microsoft_graph_group_beta : microsoft_graph_directoryObject_beta {
[object]$allowExternalSenders;
[object]$unseenCount;
[object]$description;
[object]$mailNickname;
[object]$isSubscribedByMail;
[object]$createdDateTime;
[object]$isFavorite;
[object]$displayName;
[object]$renewedDateTime;
[object]$classification;
[object]$unseenConversationsCount;
[object]$membershipRuleProcessingState;
[object]$onPremisesProvisioningErrors;
[object]$groupTypes;
[object]$autoSubscribeNewMembers;
[object]$preferredLanguage;
[object]$securityEnabled;
[object]$unseenMessagesCount;
[object]$membershipRule;
[object]$resourceBehaviorOptions;
[object]$resourceProvisioningOptions;
[object]$mailEnabled;
[object]$theme;
[object]$proxyAddresses;
[object]$visibility;
[object]$accessType;
[object]$mail;
[object]$onPremisesSyncEnabled;
[object]$onPremisesSecurityIdentifier;
[object]$onPremisesLastSyncDateTime;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/extensions")  }

[object]Get_members() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/members")  }

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/memberOf")  }

[object]Get_createdOnBehalfOf() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/createdOnBehalfOf")  }

[object]Get_owners() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/owners")  }

[object]Get_settings() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/settings")  }

[object]Get_endpoints() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/endpoints")  }

[object]Get_threads() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/threads")  }

[object]Get_calendar() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/calendar")  }

[object]Get_calendarView() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/calendarView")  }

[object]Get_events() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/events")  }

[object]Get_conversations() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/conversations")  }

[object]Get_photo() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/photo")  }

[object]Get_photos() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/photos")  }

[object]Get_acceptedSenders() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/acceptedSenders")  }

[object]Get_rejectedSenders() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/rejectedSenders")  }

[object]Get_drive() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/drive")  }

[object]Get_drives() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/drives")  }

[object]Get_sites() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/sites")  }

[object]Get_plans() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/plans")  }

[object]Get_planner() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/planner")  }

[object]Get_onenote() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/onenote")  }

[object]Get_channels() { return (Invoke-GraphMethod -Version 'beta' -Query "groups/$($this.Id)/channels")  }

}

Class microsoft_graph_mailFolder_beta : microsoft_graph_entity_beta {
[object]$unreadItemCount;
[object]$parentFolderId;
[object]$totalItemCount;
[object]$wellKnownName;
[object]$childFolderCount;
[object]$displayName;

[object]Get_messages() { return (Invoke-GraphMethod -Version 'beta' -Query "mailFolders/$($this.Id)/messages")  }

[object]Get_childFolders() { return (Invoke-GraphMethod -Version 'beta' -Query "mailFolders/$($this.Id)/childFolders")  }

[object]Get_userConfigurations() { return (Invoke-GraphMethod -Version 'beta' -Query "mailFolders/$($this.Id)/userConfigurations")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "mailFolders/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "mailFolders/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_calendar_beta : microsoft_graph_entity_beta {
[object]$canViewPrivateItems;
[object]$isShared;
[object]$changeKey;
[object]$hexColor;
[object]$canShare;
[object]$isDefaultCalendar;
[object]$isSharedWithMe;
[object]$color;
[object]$owner;
[object]$name;
[object]$canEdit;

[object]Get_events() { return (Invoke-GraphMethod -Version 'beta' -Query "calendars/$($this.Id)/events")  }

[object]Get_calendarView() { return (Invoke-GraphMethod -Version 'beta' -Query "calendars/$($this.Id)/calendarView")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "calendars/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "calendars/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_calendarGroup_beta : microsoft_graph_entity_beta {
[object]$changeKey;
[object]$classId;
[object]$name;

[object]Get_calendars() { return (Invoke-GraphMethod -Version 'beta' -Query "calendarGroups/$($this.Id)/calendars")  }

}

Class microsoft_graph_event_beta : microsoft_graph_outlookItem_beta {
[object]$onlineMeetingUrl;
[object]$isReminderOn;
[object]$subject;
[object]$webLink;
[object]$originalStart;
[object]$isCancelled;
[object]$sensitivity;
[object]$start;
[object]$location;
[object]$attendees;
[object]$originalStartTimeZone;
[object]$responseStatus;
[object]$showAs;
[object]$isOrganizer;
[object]$originalEndTimeZone;
[object]$isAllDay;
[object]$end;
[object]$responseRequested;
[object]$bodyPreview;
[object]$recurrence;
[object]$hasAttachments;
[object]$body;
[object]$type;
[object]$importance;
[object]$creationOptions;
[object]$seriesMasterId;
[object]$organizer;
[object]$iCalUId;
[object]$reminderMinutesBeforeStart;

[object]Get_calendar() { return (Invoke-GraphMethod -Version 'beta' -Query "events/$($this.Id)/calendar")  }

[object]Get_instances() { return (Invoke-GraphMethod -Version 'beta' -Query "events/$($this.Id)/instances")  }

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "events/$($this.Id)/extensions")  }

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'beta' -Query "events/$($this.Id)/attachments")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "events/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "events/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_person_beta : microsoft_graph_entity_beta {
[object]$mailboxType;
[object]$sources;
[object]$userPrincipalName;
[object]$displayName;
[object]$personNotes;
[object]$companyName;
[object]$givenName;
[object]$officeLocation;
[object]$postalAddresses;
[object]$personType;
[object]$department;
[object]$title;
[object]$birthday;
[object]$profession;
[object]$phones;
[object]$emailAddresses;
[object]$surname;
[object]$websites;
[object]$yomiCompany;
[object]$isFavorite;

}

Class microsoft_graph_contact_beta : microsoft_graph_outlookItem_beta {
[object]$middleName;
[object]$gender;
[object]$yomiCompanyName;
[object]$generation;
[object]$imAddresses;
[object]$department;
[object]$yomiSurname;
[object]$isFavorite;
[object]$displayName;
[object]$postalAddresses;
[object]$jobTitle;
[object]$nickName;
[object]$birthday;
[object]$phones;
[object]$fileAs;
[object]$givenName;
[object]$title;
[object]$assistantName;
[object]$personalNotes;
[object]$profession;
[object]$initials;
[object]$spouseName;
[object]$surname;
[object]$manager;
[object]$children;
[object]$weddingAnniversary;
[object]$officeLocation;
[object]$parentFolderId;
[object]$websites;
[object]$companyName;
[object]$emailAddresses;
[object]$yomiGivenName;
[object]$flag;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "contacts/$($this.Id)/extensions")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "contacts/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "contacts/$($this.Id)/multiValueExtendedProperties")  }

[object]Get_photo() { return (Invoke-GraphMethod -Version 'beta' -Query "contacts/$($this.Id)/photo")  }

}

Class microsoft_graph_contactFolder_beta : microsoft_graph_entity_beta {
[object]$wellKnownName;
[object]$displayName;
[object]$parentFolderId;

[object]Get_contacts() { return (Invoke-GraphMethod -Version 'beta' -Query "contactFolders/$($this.Id)/contacts")  }

[object]Get_childFolders() { return (Invoke-GraphMethod -Version 'beta' -Query "contactFolders/$($this.Id)/childFolders")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "contactFolders/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "contactFolders/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_inferenceClassification_beta : microsoft_graph_entity_beta {

[object]Get_overrides() { return (Invoke-GraphMethod -Version 'beta' -Query "inferenceClassifications/$($this.Id)/overrides")  }

}

Class microsoft_graph_profilePhoto_beta : microsoft_graph_entity_beta {
[object]$height;
[object]$width;

}

Class microsoft_graph_baseItem_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$description;
[object]$createdBy;
[object]$lastModifiedBy;
[object]$eTag;
[object]$name;
[object]$createdDateTime;
[object]$parentReference;
[object]$webUrl;

[object]Get_createdByUser() { return (Invoke-GraphMethod -Version 'beta' -Query "baseItems/$($this.Id)/createdByUser")  }

[object]Get_lastModifiedByUser() { return (Invoke-GraphMethod -Version 'beta' -Query "baseItems/$($this.Id)/lastModifiedByUser")  }

}

Class microsoft_graph_drive_beta : microsoft_graph_baseItem_beta {
[object]$sharePointIds;
[object]$driveType;
[object]$quota;
[object]$owner;

[object]Get_items() { return (Invoke-GraphMethod -Version 'beta' -Query "drives/$($this.Id)/items")  }

[object]Get_list() { return (Invoke-GraphMethod -Version 'beta' -Query "drives/$($this.Id)/list")  }

[object]Get_root() { return (Invoke-GraphMethod -Version 'beta' -Query "drives/$($this.Id)/root")  }

[object]Get_special() { return (Invoke-GraphMethod -Version 'beta' -Query "drives/$($this.Id)/special")  }

}

Class microsoft_graph_officeGraphInsights_beta : microsoft_graph_entity_beta {

[object]Get_trending() { return (Invoke-GraphMethod -Version 'beta' -Query "officeGraphInsightss/$($this.Id)/trending")  }

}

Class microsoft_graph_driveItem_beta : microsoft_graph_baseItem_beta {
[object]$shared;
[object]$photo;
[object]$cTag;
[object]$folder;
[object]$deleted;
[object]$sharepointIds;
[object]$searchResult;
[object]$image;
[object]$file;
[object]$root;
[object]$package;
[object]$webDavUrl;
[object]$audio;
[object]$content;
[object]$size;
[object]$video;
[object]$fileSystemInfo;
[object]$location;
[object]$specialFolder;
[object]$remoteItem;

[object]Get_workbook() { return (Invoke-GraphMethod -Version 'beta' -Query "driveItems/$($this.Id)/workbook")  }

[object]Get_children() { return (Invoke-GraphMethod -Version 'beta' -Query "driveItems/$($this.Id)/children")  }

[object]Get_listItem() { return (Invoke-GraphMethod -Version 'beta' -Query "driveItems/$($this.Id)/listItem")  }

[object]Get_permissions() { return (Invoke-GraphMethod -Version 'beta' -Query "driveItems/$($this.Id)/permissions")  }

[object]Get_thumbnails() { return (Invoke-GraphMethod -Version 'beta' -Query "driveItems/$($this.Id)/thumbnails")  }

}

Class microsoft_graph_task_beta : microsoft_graph_entity_beta {
[object]$planId;
[object]$assignedTo;
[object]$startDateTime;
[object]$completedDateTime;
[object]$appliedCategories;
[object]$dueDateTime;
[object]$createdDateTime;
[object]$assignedBy;
[object]$hasDescription;
[object]$assigneePriority;
[object]$percentComplete;
[object]$title;
[object]$bucketId;
[object]$orderHint;
[object]$assignedDateTime;
[object]$previewType;
[object]$conversationThreadId;
[object]$createdBy;

[object]Get_details() { return (Invoke-GraphMethod -Version 'beta' -Query "tasks/$($this.Id)/details")  }

[object]Get_assignedToTaskBoardFormat() { return (Invoke-GraphMethod -Version 'beta' -Query "tasks/$($this.Id)/assignedToTaskBoardFormat")  }

[object]Get_progressTaskBoardFormat() { return (Invoke-GraphMethod -Version 'beta' -Query "tasks/$($this.Id)/progressTaskBoardFormat")  }

[object]Get_bucketTaskBoardFormat() { return (Invoke-GraphMethod -Version 'beta' -Query "tasks/$($this.Id)/bucketTaskBoardFormat")  }

}

Class microsoft_graph_plan_beta : microsoft_graph_entity_beta {
[object]$createdBy;
[object]$title;
[object]$createdDateTime;
[object]$owner;
[object]$isVisibleInPlannerWebClient;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "plans/$($this.Id)/tasks")  }

[object]Get_buckets() { return (Invoke-GraphMethod -Version 'beta' -Query "plans/$($this.Id)/buckets")  }

[object]Get_details() { return (Invoke-GraphMethod -Version 'beta' -Query "plans/$($this.Id)/details")  }

[object]Get_assignedToTaskBoard() { return (Invoke-GraphMethod -Version 'beta' -Query "plans/$($this.Id)/assignedToTaskBoard")  }

[object]Get_progressTaskBoard() { return (Invoke-GraphMethod -Version 'beta' -Query "plans/$($this.Id)/progressTaskBoard")  }

[object]Get_bucketTaskBoard() { return (Invoke-GraphMethod -Version 'beta' -Query "plans/$($this.Id)/bucketTaskBoard")  }

}

Class microsoft_graph_plannerUser_beta : microsoft_graph_entity_beta {

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerUsers/$($this.Id)/tasks")  }

[object]Get_plans() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerUsers/$($this.Id)/plans")  }

}

Class microsoft_graph_onenote_beta : microsoft_graph_entity_beta {

[object]Get_notebooks() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotes/$($this.Id)/notebooks")  }

[object]Get_sections() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotes/$($this.Id)/sections")  }

[object]Get_sectionGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotes/$($this.Id)/sectionGroups")  }

[object]Get_pages() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotes/$($this.Id)/pages")  }

[object]Get_resources() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotes/$($this.Id)/resources")  }

[object]Get_operations() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotes/$($this.Id)/operations")  }

}

Class microsoft_graph_managedDevice_beta : microsoft_graph_entity_beta {
[object]$aadRegistered;
[object]$deviceCategoryDisplayName;
[object]$userId;
[object]$lastSyncDateTime;
[object]$exchangeAccessStateReason;
[object]$managementAgent;
[object]$complianceState;
[object]$osVersion;
[object]$isEncrypted;
[object]$model;
[object]$enrollmentType;
[object]$deviceRegistrationState;
[object]$hardwareInformation;
[object]$emailAddress;
[object]$enrolledDateTime;
[object]$activationLockBypassCode;
[object]$isSupervised;
[object]$managementAgents;
[object]$azureActiveDirectoryDeviceId;
[object]$operatingSystem;
[object]$easActivated;
[object]$chassisType;
[object]$easDeviceId;
[object]$managementState;
[object]$lostModeState;
[object]$deviceName;
[object]$deviceType;
[object]$easActivationDateTime;
[object]$exchangeLastSuccessfulSyncDateTime;
[object]$ownerType;
[object]$deviceActionResults;
[object]$manufacturer;
[object]$exchangeAccessState;
[object]$remoteAssistanceSessionUrl;
[object]$jailBroken;

[object]Get_deviceConfigurationStates() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDevices/$($this.Id)/deviceConfigurationStates")  }

[object]Get_detectedApps() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDevices/$($this.Id)/detectedApps")  }

[object]Get_deviceCategory() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDevices/$($this.Id)/deviceCategory")  }

[object]Get_deviceCompliancePolicyStates() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDevices/$($this.Id)/deviceCompliancePolicyStates")  }

}

Class microsoft_graph_managedAppRegistration_beta : microsoft_graph_entity_beta {
[object]$lastSyncDateTime;
[object]$managementSdkVersion;
[object]$deviceTag;
[object]$platformVersion;
[object]$version;
[object]$deviceName;
[object]$createdDateTime;
[object]$userId;
[object]$deviceType;
[object]$applicationVersion;
[object]$flaggedReasons;
[object]$appIdentifier;

[object]Get_appliedPolicies() { return (Invoke-GraphMethod -Version 'beta' -Query "managedAppRegistrations/$($this.Id)/appliedPolicies")  }

[object]Get_intendedPolicies() { return (Invoke-GraphMethod -Version 'beta' -Query "managedAppRegistrations/$($this.Id)/intendedPolicies")  }

[object]Get_operations() { return (Invoke-GraphMethod -Version 'beta' -Query "managedAppRegistrations/$($this.Id)/operations")  }

}

Class microsoft_graph_device_beta : microsoft_graph_directoryObject_beta {
[object]$accountEnabled;
[object]$operatingSystem;
[object]$Platform;
[object]$Manufacturer;
[object]$displayName;
[object]$operatingSystemVersion;
[object]$deviceVersion;
[object]$alternativeSecurityIds;
[object]$Name;
[object]$onPremisesLastSyncDateTime;
[object]$Kind;
[object]$approximateLastSignInDateTime;
[object]$Model;
[object]$physicalIds;
[object]$isManaged;
[object]$Status;
[object]$deviceMetadata;
[object]$trustType;
[object]$deviceId;
[object]$onPremisesSyncEnabled;
[object]$isCompliant;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "devices/$($this.Id)/extensions")  }

[object]Get_registeredOwners() { return (Invoke-GraphMethod -Version 'beta' -Query "devices/$($this.Id)/registeredOwners")  }

[object]Get_registeredUsers() { return (Invoke-GraphMethod -Version 'beta' -Query "devices/$($this.Id)/registeredUsers")  }

[object]Get_commands() { return (Invoke-GraphMethod -Version 'beta' -Query "devices/$($this.Id)/commands")  }

}

Class microsoft_graph_directorySetting_beta : microsoft_graph_entity_beta {
[object]$templateId;
[object]$displayName;
[object]$values;

}

Class microsoft_graph_endpoint_beta : microsoft_graph_directoryObject_beta {
[object]$providerResourceId;
[object]$capability;
[object]$providerId;
[object]$providerName;
[object]$uri;

}

Class microsoft_graph_conversationThread_beta : microsoft_graph_entity_beta {
[object]$lastDeliveredDateTime;
[object]$toRecipients;
[object]$hasAttachments;
[object]$isLocked;
[object]$topic;
[object]$uniqueSenders;
[object]$preview;
[object]$ccRecipients;

[object]Get_posts() { return (Invoke-GraphMethod -Version 'beta' -Query "conversationThreads/$($this.Id)/posts")  }

}

Class microsoft_graph_conversation_beta : microsoft_graph_entity_beta {
[object]$lastDeliveredDateTime;
[object]$preview;
[object]$uniqueSenders;
[object]$hasAttachments;
[object]$topic;

[object]Get_threads() { return (Invoke-GraphMethod -Version 'beta' -Query "conversations/$($this.Id)/threads")  }

}

Class microsoft_graph_site_beta : microsoft_graph_baseItem_beta {
[object]$sharepointIds;
[object]$root;
[object]$displayName;
[object]$siteCollection;

[object]Get_columns() { return (Invoke-GraphMethod -Version 'beta' -Query "sites/$($this.Id)/columns")  }

[object]Get_drive() { return (Invoke-GraphMethod -Version 'beta' -Query "sites/$($this.Id)/drive")  }

[object]Get_drives() { return (Invoke-GraphMethod -Version 'beta' -Query "sites/$($this.Id)/drives")  }

[object]Get_items() { return (Invoke-GraphMethod -Version 'beta' -Query "sites/$($this.Id)/items")  }

[object]Get_lists() { return (Invoke-GraphMethod -Version 'beta' -Query "sites/$($this.Id)/lists")  }

[object]Get_sites() { return (Invoke-GraphMethod -Version 'beta' -Query "sites/$($this.Id)/sites")  }

}

Class microsoft_graph_plannerGroup_beta : microsoft_graph_entity_beta {

[object]Get_plans() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerGroups/$($this.Id)/plans")  }

}

Class microsoft_graph_channel_beta : microsoft_graph_entity_beta {
[object]$displayName;
[object]$description;

[object]Get_chatThreads() { return (Invoke-GraphMethod -Version 'beta' -Query "channels/$($this.Id)/chatThreads")  }

}

Class microsoft_graph_command_beta : microsoft_graph_entity_beta {
[object]$PostBackUri;
[object]$Type;
[object]$PackageFamilyName;
[object]$PermissionTicket;
[object]$Error;
[object]$Payload;
[object]$Status;
[object]$AppServiceName;

[object]Get_responsepayload() { return (Invoke-GraphMethod -Version 'beta' -Query "commands/$($this.Id)/responsepayload")  }

}

Class microsoft_graph_administrativeUnit_beta : microsoft_graph_directoryObject_beta {
[object]$description;
[object]$displayName;
[object]$visibility;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "administrativeUnits/$($this.Id)/extensions")  }

[object]Get_members() { return (Invoke-GraphMethod -Version 'beta' -Query "administrativeUnits/$($this.Id)/members")  }

[object]Get_scopedRoleMembers() { return (Invoke-GraphMethod -Version 'beta' -Query "administrativeUnits/$($this.Id)/scopedRoleMembers")  }

}

Class microsoft_graph_organization_beta : microsoft_graph_directoryObject_beta {
[object]$onPremisesSyncEnabled;
[object]$country;
[object]$defaultDeviceEnrollmentWindowsHelloForBusinessSettings;
[object]$verifiedDomains;
[object]$displayName;
[object]$mobileDeviceManagementAuthority;
[object]$assignedPlans;
[object]$securityComplianceNotificationPhones;
[object]$marketingNotificationEmails;
[object]$businessPhones;
[object]$applePushNotificationCertificateSetting;
[object]$street;
[object]$defaultDeviceEnrollmentRestrictions;
[object]$onPremisesLastSyncDateTime;
[object]$technicalNotificationMails;
[object]$countryLetterCode;
[object]$preferredLanguage;
[object]$state;
[object]$provisionedPlans;
[object]$defaultDeviceEnrollmentLimit;
[object]$city;
[object]$postalCode;
[object]$securityComplianceNotificationMails;
[object]$intuneBrand;
[object]$certificateConnectorSetting;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "organizations/$($this.Id)/extensions")  }

[object]Get_depOnboardingSettings() { return (Invoke-GraphMethod -Version 'beta' -Query "organizations/$($this.Id)/depOnboardingSettings")  }

[object]Get_appleVolumePurchaseProgramTokens() { return (Invoke-GraphMethod -Version 'beta' -Query "organizations/$($this.Id)/appleVolumePurchaseProgramTokens")  }

}

Class microsoft_graph_depOnboardingSetting_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$tokenExpirationDateTime;
[object]$shareTokenWithSchoolDataSyncService;
[object]$lastSyncErrorCode;
[object]$lastSuccessfulSyncDateTime;
[object]$appleIdentifier;
[object]$lastSyncTriggeredDateTime;

}

Class microsoft_graph_appleVolumePurchaseProgramToken_beta : microsoft_graph_entity_beta {
[object]$lastSyncDateTime;
[object]$lastSyncStatus;
[object]$token;
[object]$state;
[object]$appleId;
[object]$expirationDateTime;
[object]$organizationName;
[object]$lastModifiedDateTime;
[object]$volumePurchaseProgramTokenAccountType;

}

Class microsoft_graph_schemaExtension_beta : microsoft_graph_entity_beta {
[object]$targetTypes;
[object]$description;
[object]$status;
[object]$properties;
[object]$owner;

}

Class microsoft_graph_directory_beta : microsoft_graph_entity_beta {

[object]Get_deletedItems() { return (Invoke-GraphMethod -Version 'beta' -Query "directorys/$($this.Id)/deletedItems")  }

}

Class microsoft_graph_extensionProperty_beta : microsoft_graph_directoryObject_beta {
[object]$targetObjects;
[object]$isSyncedFromOnPremises;
[object]$appDisplayName;
[object]$name;
[object]$dataType;

}

Class microsoft_graph_application_beta : microsoft_graph_directoryObject_beta {
[object]$logoutUrl;
[object]$oauth2Permissions;
[object]$identifierUris;
[object]$replyUrls;
[object]$displayName;
[object]$appId;
[object]$publicClient;
[object]$errorUrl;
[object]$recordConsentConditions;
[object]$onPremisesPublishing;
[object]$keyCredentials;
[object]$oauth2AllowImplicitFlow;
[object]$knownClientApplications;
[object]$oauth2RequirePostResponse;
[object]$passwordCredentials;
[object]$groupMembershipClaims;
[object]$addIns;
[object]$mainLogo;
[object]$samlMetadataUrl;
[object]$availableToOtherOrganizations;
[object]$homepage;
[object]$appRoles;
[object]$oauth2AllowUrlPathMatching;
[object]$requiredResourceAccess;

[object]Get_extensionProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "applications/$($this.Id)/extensionProperties")  }

[object]Get_createdOnBehalfOf() { return (Invoke-GraphMethod -Version 'beta' -Query "applications/$($this.Id)/createdOnBehalfOf")  }

[object]Get_owners() { return (Invoke-GraphMethod -Version 'beta' -Query "applications/$($this.Id)/owners")  }

[object]Get_policies() { return (Invoke-GraphMethod -Version 'beta' -Query "applications/$($this.Id)/policies")  }

[object]Get_connectorGroup() { return (Invoke-GraphMethod -Version 'beta' -Query "applications/$($this.Id)/connectorGroup")  }

}

Class microsoft_graph_connectorGroup_beta : microsoft_graph_entity_beta {
[object]$isDefault;
[object]$name;
[object]$connectorGroupType;

[object]Get_members() { return (Invoke-GraphMethod -Version 'beta' -Query "connectorGroups/$($this.Id)/members")  }

[object]Get_applications() { return (Invoke-GraphMethod -Version 'beta' -Query "connectorGroups/$($this.Id)/applications")  }

}

Class microsoft_graph_appRoleAssignment_beta : microsoft_graph_entity_beta {
[object]$resourceId;
[object]$principalType;
[object]$creationTimestamp;
[object]$resourceDisplayName;
[object]$principalId;
[object]$principalDisplayName;

}

Class microsoft_graph_orgContact_beta : microsoft_graph_directoryObject_beta {
[object]$onPremisesSyncEnabled;
[object]$country;
[object]$displayName;
[object]$companyName;
[object]$givenName;
[object]$officeLocation;
[object]$businessPhones;
[object]$surname;
[object]$department;
[object]$proxyAddresses;
[object]$onPremisesLastSyncDateTime;
[object]$mail;
[object]$streetAddress;
[object]$postalCode;
[object]$mobilePhone;
[object]$state;
[object]$mailNickname;
[object]$jobTitle;
[object]$city;
[object]$onPremisesProvisioningErrors;

[object]Get_manager() { return (Invoke-GraphMethod -Version 'beta' -Query "orgContacts/$($this.Id)/manager")  }

[object]Get_directReports() { return (Invoke-GraphMethod -Version 'beta' -Query "orgContacts/$($this.Id)/directReports")  }

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'beta' -Query "orgContacts/$($this.Id)/memberOf")  }

}

Class microsoft_graph_directoryRole_beta : microsoft_graph_directoryObject_beta {
[object]$description;
[object]$displayName;
[object]$roleTemplateId;

[object]Get_members() { return (Invoke-GraphMethod -Version 'beta' -Query "directoryRoles/$($this.Id)/members")  }

[object]Get_scopedMembers() { return (Invoke-GraphMethod -Version 'beta' -Query "directoryRoles/$($this.Id)/scopedMembers")  }

}

Class microsoft_graph_directoryRoleTemplate_beta : microsoft_graph_directoryObject_beta {
[object]$displayName;
[object]$description;

}

Class microsoft_graph_directorySettingTemplate_beta : microsoft_graph_directoryObject_beta {
[object]$values;
[object]$description;
[object]$displayName;

}

Class microsoft_graph_domain_beta : microsoft_graph_entity_beta {
[object]$isAdminManaged;
[object]$isInitial;
[object]$availabilityStatus;
[object]$supportedServices;
[object]$isRoot;
[object]$state;
[object]$authenticationType;
[object]$isVerified;
[object]$isDefault;

[object]Get_serviceConfigurationRecords() { return (Invoke-GraphMethod -Version 'beta' -Query "domains/$($this.Id)/serviceConfigurationRecords")  }

[object]Get_verificationDnsRecords() { return (Invoke-GraphMethod -Version 'beta' -Query "domains/$($this.Id)/verificationDnsRecords")  }

[object]Get_domainNameReferences() { return (Invoke-GraphMethod -Version 'beta' -Query "domains/$($this.Id)/domainNameReferences")  }

}

Class microsoft_graph_domainDnsRecord_beta : microsoft_graph_entity_beta {
[object]$label;
[object]$ttl;
[object]$isOptional;
[object]$supportedService;
[object]$recordType;

}

Class microsoft_graph_domainDnsCnameRecord_beta : microsoft_graph_domainDnsRecord_beta {
[object]$canonicalName;

}

Class microsoft_graph_domainDnsMxRecord_beta : microsoft_graph_domainDnsRecord_beta {
[object]$preference;
[object]$mailExchange;

}

Class microsoft_graph_domainDnsSrvRecord_beta : microsoft_graph_domainDnsRecord_beta {
[object]$weight;
[object]$nameTarget;
[object]$port;
[object]$service;
[object]$priority;
[object]$protocol;

}

Class microsoft_graph_domainDnsTxtRecord_beta : microsoft_graph_domainDnsRecord_beta {
[object]$text;

}

Class microsoft_graph_domainDnsUnavailableRecord_beta : microsoft_graph_domainDnsRecord_beta {
[object]$description;

}

Class microsoft_graph_oAuth2PermissionGrant_beta : microsoft_graph_entity_beta {
[object]$resourceId;
[object]$clientId;
[object]$expiryTime;
[object]$consentType;
[object]$scope;
[object]$principalId;
[object]$startTime;

}

Class microsoft_graph_policy_beta : microsoft_graph_directoryObject_beta {
[object]$isOrganizationDefault;
[object]$displayName;
[object]$definition;
[object]$alternativeIdentifier;
[object]$type;
[object]$keyCredentials;

[object]Get_appliesTo() { return (Invoke-GraphMethod -Version 'beta' -Query "policys/$($this.Id)/appliesTo")  }

}

Class microsoft_graph_servicePrincipal_beta : microsoft_graph_directoryObject_beta {
[object]$accountEnabled;
[object]$oauth2Permissions;
[object]$tags;
[object]$replyUrls;
[object]$preferredTokenSigningKeyThumbprint;
[object]$displayName;
[object]$appId;
[object]$errorUrl;
[object]$keyCredentials;
[object]$appDisplayName;
[object]$appRoleAssignmentRequired;
[object]$appOwnerOrganizationId;
[object]$addIns;
[object]$logoutUrl;
[object]$samlMetadataUrl;
[object]$homepage;
[object]$appRoles;
[object]$passwordCredentials;
[object]$publisherName;
[object]$servicePrincipalNames;

[object]Get_appRoleAssignedTo() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/appRoleAssignedTo")  }

[object]Get_appRoleAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/appRoleAssignments")  }

[object]Get_oauth2PermissionGrants() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/oauth2PermissionGrants")  }

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/memberOf")  }

[object]Get_createdObjects() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/createdObjects")  }

[object]Get_licenseDetails() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/licenseDetails")  }

[object]Get_owners() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/owners")  }

[object]Get_ownedObjects() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/ownedObjects")  }

[object]Get_policies() { return (Invoke-GraphMethod -Version 'beta' -Query "servicePrincipals/$($this.Id)/policies")  }

}

Class microsoft_graph_subscribedSku_beta : microsoft_graph_entity_beta {
[object]$skuPartNumber;
[object]$appliesTo;
[object]$prepaidUnits;
[object]$skuId;
[object]$servicePlans;
[object]$capabilityStatus;
[object]$consumedUnits;

}

Class microsoft_graph_contract_beta : microsoft_graph_directoryObject_beta {
[object]$contractType;
[object]$customerId;
[object]$displayName;
[object]$defaultDomainName;

}

Class microsoft_graph_sharePoint_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_columnDefinition_beta : microsoft_graph_entity_beta {
[object]$required;
[object]$number;
[object]$name;
[object]$enforceUniqueValues;
[object]$personOrGroup;
[object]$hidden;
[object]$indexed;
[object]$boolean;
[object]$calculated;
[object]$text;
[object]$dateTime;
[object]$description;
[object]$readOnly;
[object]$lookup;
[object]$choice;

}

Class microsoft_graph_list_beta : microsoft_graph_baseItem_beta {
[object]$list;
[object]$sharepointIds;

[object]Get_columns() { return (Invoke-GraphMethod -Version 'beta' -Query "lists/$($this.Id)/columns")  }

[object]Get_drive() { return (Invoke-GraphMethod -Version 'beta' -Query "lists/$($this.Id)/drive")  }

[object]Get_items() { return (Invoke-GraphMethod -Version 'beta' -Query "lists/$($this.Id)/items")  }

}

Class microsoft_graph_listItem_beta : microsoft_graph_baseItem_beta {
[object]$sharepointIds;

[object]Get_driveItem() { return (Invoke-GraphMethod -Version 'beta' -Query "listItems/$($this.Id)/driveItem")  }

[object]Get_fields() { return (Invoke-GraphMethod -Version 'beta' -Query "listItems/$($this.Id)/fields")  }

}

Class microsoft_graph_workbook_beta : microsoft_graph_entity_beta {

[object]Get_application() { return (Invoke-GraphMethod -Version 'beta' -Query "workbooks/$($this.Id)/application")  }

[object]Get_names() { return (Invoke-GraphMethod -Version 'beta' -Query "workbooks/$($this.Id)/names")  }

[object]Get_tables() { return (Invoke-GraphMethod -Version 'beta' -Query "workbooks/$($this.Id)/tables")  }

[object]Get_worksheets() { return (Invoke-GraphMethod -Version 'beta' -Query "workbooks/$($this.Id)/worksheets")  }

[object]Get_functions() { return (Invoke-GraphMethod -Version 'beta' -Query "workbooks/$($this.Id)/functions")  }

}

Class microsoft_graph_permission_beta : microsoft_graph_entity_beta {
[object]$link;
[object]$roles;
[object]$shareId;
[object]$inheritedFrom;
[object]$grantedTo;
[object]$invitation;

}

Class microsoft_graph_thumbnailSet_beta : microsoft_graph_entity_beta {
[object]$source;
[object]$large;
[object]$small;
[object]$medium;

}

Class microsoft_graph_workbookApplication_beta : microsoft_graph_entity_beta {
[object]$calculationMode;

}

Class microsoft_graph_workbookNamedItem_beta : microsoft_graph_entity_beta {
[object]$comment;
[object]$type;
[object]$visible;
[object]$value;
[object]$name;
[object]$scope;

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookNamedItems/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookTable_beta : microsoft_graph_entity_beta {
[object]$showBandedColumns;
[object]$showTotals;
[object]$showBandedRows;
[object]$showFilterButton;
[object]$name;
[object]$showHeaders;
[object]$highlightFirstColumn;
[object]$style;
[object]$highlightLastColumn;

[object]Get_columns() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookTables/$($this.Id)/columns")  }

[object]Get_rows() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookTables/$($this.Id)/rows")  }

[object]Get_sort() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookTables/$($this.Id)/sort")  }

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookTables/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookWorksheet_beta : microsoft_graph_entity_beta {
[object]$position;
[object]$visibility;
[object]$name;

[object]Get_charts() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookWorksheets/$($this.Id)/charts")  }

[object]Get_names() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookWorksheets/$($this.Id)/names")  }

[object]Get_pivotTables() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookWorksheets/$($this.Id)/pivotTables")  }

[object]Get_protection() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookWorksheets/$($this.Id)/protection")  }

[object]Get_tables() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookWorksheets/$($this.Id)/tables")  }

}

Class microsoft_graph_workbookFunctions_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_workbookChart_beta : microsoft_graph_entity_beta {
[object]$left;
[object]$width;
[object]$name;
[object]$height;
[object]$top;

[object]Get_axes() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/axes")  }

[object]Get_dataLabels() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/dataLabels")  }

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/format")  }

[object]Get_legend() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/legend")  }

[object]Get_series() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/series")  }

[object]Get_title() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/title")  }

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookCharts/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookChartAxes_beta : microsoft_graph_entity_beta {

[object]Get_categoryAxis() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxess/$($this.Id)/categoryAxis")  }

[object]Get_seriesAxis() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxess/$($this.Id)/seriesAxis")  }

[object]Get_valueAxis() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxess/$($this.Id)/valueAxis")  }

}

Class microsoft_graph_workbookChartDataLabels_beta : microsoft_graph_entity_beta {
[object]$position;
[object]$showLegendKey;
[object]$showSeriesName;
[object]$showPercentage;
[object]$separator;
[object]$showBubbleSize;
[object]$showValue;
[object]$showCategoryName;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartDataLabelss/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartAreaFormat_beta : microsoft_graph_entity_beta {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAreaFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAreaFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartLegend_beta : microsoft_graph_entity_beta {
[object]$position;
[object]$overlay;
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartLegends/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartSeries_beta : microsoft_graph_entity_beta {
[object]$name;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartSeriess/$($this.Id)/format")  }

[object]Get_points() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartSeriess/$($this.Id)/points")  }

}

Class microsoft_graph_workbookChartTitle_beta : microsoft_graph_entity_beta {
[object]$overlay;
[object]$text;
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartTitles/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartFill_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_workbookChartFont_beta : microsoft_graph_entity_beta {
[object]$underline;
[object]$italic;
[object]$color;
[object]$name;
[object]$size;
[object]$bold;

}

Class microsoft_graph_workbookChartAxis_beta : microsoft_graph_entity_beta {
[object]$minimum;
[object]$majorUnit;
[object]$minorUnit;
[object]$maximum;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxiss/$($this.Id)/format")  }

[object]Get_majorGridlines() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxiss/$($this.Id)/majorGridlines")  }

[object]Get_minorGridlines() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxiss/$($this.Id)/minorGridlines")  }

[object]Get_title() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxiss/$($this.Id)/title")  }

}

Class microsoft_graph_workbookChartAxisFormat_beta : microsoft_graph_entity_beta {

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxisFormats/$($this.Id)/font")  }

[object]Get_line() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxisFormats/$($this.Id)/line")  }

}

Class microsoft_graph_workbookChartGridlines_beta : microsoft_graph_entity_beta {
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartGridliness/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartAxisTitle_beta : microsoft_graph_entity_beta {
[object]$text;
[object]$visible;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxisTitles/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartLineFormat_beta : microsoft_graph_entity_beta {
[object]$color;

}

Class microsoft_graph_workbookChartAxisTitleFormat_beta : microsoft_graph_entity_beta {

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartAxisTitleFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartDataLabelFormat_beta : microsoft_graph_entity_beta {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartDataLabelFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartDataLabelFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartGridlinesFormat_beta : microsoft_graph_entity_beta {

[object]Get_line() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartGridlinesFormats/$($this.Id)/line")  }

}

Class microsoft_graph_workbookChartLegendFormat_beta : microsoft_graph_entity_beta {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartLegendFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartLegendFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookChartPoint_beta : microsoft_graph_entity_beta {
[object]$value;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartPoints/$($this.Id)/format")  }

}

Class microsoft_graph_workbookChartPointFormat_beta : microsoft_graph_entity_beta {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartPointFormats/$($this.Id)/fill")  }

}

Class microsoft_graph_workbookChartSeriesFormat_beta : microsoft_graph_entity_beta {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartSeriesFormats/$($this.Id)/fill")  }

[object]Get_line() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartSeriesFormats/$($this.Id)/line")  }

}

Class microsoft_graph_workbookChartTitleFormat_beta : microsoft_graph_entity_beta {

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartTitleFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookChartTitleFormats/$($this.Id)/font")  }

}

Class microsoft_graph_workbookFilter_beta : microsoft_graph_entity_beta {
[object]$criteria;

}

Class microsoft_graph_workbookFormatProtection_beta : microsoft_graph_entity_beta {
[object]$formulaHidden;
[object]$locked;

}

Class microsoft_graph_workbookFunctionResult_beta : microsoft_graph_entity_beta {
[object]$error;
[object]$value;

}

Class microsoft_graph_workbookPivotTable_beta : microsoft_graph_entity_beta {
[object]$name;

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookPivotTables/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookRange_beta : microsoft_graph_entity_beta {
[object]$cellCount;
[object]$columnHidden;
[object]$addressLocal;
[object]$rowIndex;
[object]$rowHidden;
[object]$valueTypes;
[object]$values;
[object]$hidden;
[object]$formulasR1C1;
[object]$address;
[object]$columnIndex;
[object]$formulas;
[object]$numberFormat;
[object]$formulasLocal;
[object]$columnCount;
[object]$text;
[object]$rowCount;

[object]Get_format() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRanges/$($this.Id)/format")  }

[object]Get_sort() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRanges/$($this.Id)/sort")  }

[object]Get_worksheet() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRanges/$($this.Id)/worksheet")  }

}

Class microsoft_graph_workbookRangeFormat_beta : microsoft_graph_entity_beta {
[object]$verticalAlignment;
[object]$horizontalAlignment;
[object]$columnWidth;
[object]$rowHeight;
[object]$wrapText;

[object]Get_borders() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRangeFormats/$($this.Id)/borders")  }

[object]Get_fill() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRangeFormats/$($this.Id)/fill")  }

[object]Get_font() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRangeFormats/$($this.Id)/font")  }

[object]Get_protection() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRangeFormats/$($this.Id)/protection")  }

}

Class microsoft_graph_workbookRangeSort_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_workbookRangeBorder_beta : microsoft_graph_entity_beta {
[object]$sideIndex;
[object]$color;
[object]$style;
[object]$weight;

}

Class microsoft_graph_workbookRangeFill_beta : microsoft_graph_entity_beta {
[object]$color;

}

Class microsoft_graph_workbookRangeFont_beta : microsoft_graph_entity_beta {
[object]$underline;
[object]$italic;
[object]$color;
[object]$name;
[object]$size;
[object]$bold;

}

Class microsoft_graph_workbookRangeView_beta : microsoft_graph_entity_beta {
[object]$numberFormat;
[object]$text;
[object]$cellAddresses;
[object]$formulas;
[object]$formulasLocal;
[object]$rowCount;
[object]$index;
[object]$values;
[object]$valueTypes;
[object]$formulasR1C1;
[object]$columnCount;

[object]Get_rows() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookRangeViews/$($this.Id)/rows")  }

}

Class microsoft_graph_workbookTableColumn_beta : microsoft_graph_entity_beta {
[object]$values;
[object]$name;
[object]$index;

[object]Get_filter() { return (Invoke-GraphMethod -Version 'beta' -Query "workbookTableColumns/$($this.Id)/filter")  }

}

Class microsoft_graph_workbookTableRow_beta : microsoft_graph_entity_beta {
[object]$values;
[object]$index;

}

Class microsoft_graph_workbookTableSort_beta : microsoft_graph_entity_beta {
[object]$method;
[object]$fields;
[object]$matchCase;

}

Class microsoft_graph_workbookWorksheetProtection_beta : microsoft_graph_entity_beta {
[object]$options;
[object]$protected;

}

Class microsoft_graph_attachment_beta : microsoft_graph_entity_beta {
[object]$contentType;
[object]$lastModifiedDateTime;
[object]$isInline;
[object]$name;
[object]$size;

}

Class microsoft_graph_outlookTaskGroup_beta : microsoft_graph_entity_beta {
[object]$changeKey;
[object]$groupKey;
[object]$name;
[object]$isDefaultGroup;

[object]Get_taskFolders() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTaskGroups/$($this.Id)/taskFolders")  }

}

Class microsoft_graph_outlookTaskFolder_beta : microsoft_graph_entity_beta {
[object]$changeKey;
[object]$name;
[object]$parentGroupKey;
[object]$isDefaultFolder;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTaskFolders/$($this.Id)/tasks")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTaskFolders/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTaskFolders/$($this.Id)/multiValueExtendedProperties")  }

}

Class microsoft_graph_outlookTask_beta : microsoft_graph_outlookItem_beta {
[object]$assignedTo;
[object]$body;
[object]$subject;
[object]$importance;
[object]$startDateTime;
[object]$owner;
[object]$dueDateTime;
[object]$isReminderOn;
[object]$reminderDateTime;
[object]$recurrence;
[object]$sensitivity;
[object]$completedDateTime;
[object]$status;
[object]$hasAttachments;
[object]$parentFolderId;

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTasks/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTasks/$($this.Id)/multiValueExtendedProperties")  }

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'beta' -Query "outlookTasks/$($this.Id)/attachments")  }

}

Class microsoft_graph_userConfiguration_beta : microsoft_graph_entity_beta {
[object]$binaryData;

}

Class microsoft_graph_singleValueLegacyExtendedProperty_beta : microsoft_graph_entity_beta {
[object]$value;

}

Class microsoft_graph_multiValueLegacyExtendedProperty_beta : microsoft_graph_entity_beta {
[object]$value;

}

Class microsoft_graph_mention_beta : microsoft_graph_entity_beta {
[object]$createdBy;
[object]$mentionText;
[object]$createdDateTime;
[object]$deepLink;
[object]$clientReference;
[object]$application;
[object]$serverCreatedDateTime;
[object]$mentioned;

}

Class microsoft_graph_fileAttachment_beta : microsoft_graph_attachment_beta {
[object]$contentId;
[object]$contentLocation;
[object]$contentBytes;

}

Class microsoft_graph_itemAttachment_beta : microsoft_graph_attachment_beta {

[object]Get_item() { return (Invoke-GraphMethod -Version 'beta' -Query "itemAttachments/$($this.Id)/item")  }

}

Class microsoft_graph_eventMessage_beta : microsoft_graph_message_beta {
[object]$startDateTime;
[object]$type;
[object]$isOutOfDate;
[object]$isDelegated;
[object]$recurrence;
[object]$meetingMessageType;
[object]$endDateTime;
[object]$location;
[object]$isAllDay;

[object]Get_event() { return (Invoke-GraphMethod -Version 'beta' -Query "eventMessages/$($this.Id)/event")  }

}

Class microsoft_graph_eventMessageRequest_beta : microsoft_graph_eventMessage_beta {
[object]$previousEndDateTime;
[object]$previousStartDateTime;
[object]$responseRequested;
[object]$previousLocation;

}

Class microsoft_graph_referenceAttachment_beta : microsoft_graph_attachment_beta {
[object]$thumbnailUrl;
[object]$permission;
[object]$providerType;
[object]$sourceUrl;
[object]$isFolder;
[object]$previewUrl;

}

Class microsoft_graph_openTypeExtension_beta : microsoft_graph_extension_beta {
[object]$extensionName;

}

Class microsoft_graph_post_beta : microsoft_graph_outlookItem_beta {
[object]$hasAttachments;
[object]$receivedDateTime;
[object]$conversationThreadId;
[object]$sender;
[object]$newParticipants;
[object]$body;
[object]$from;
[object]$conversationId;

[object]Get_extensions() { return (Invoke-GraphMethod -Version 'beta' -Query "posts/$($this.Id)/extensions")  }

[object]Get_inReplyTo() { return (Invoke-GraphMethod -Version 'beta' -Query "posts/$($this.Id)/inReplyTo")  }

[object]Get_attachments() { return (Invoke-GraphMethod -Version 'beta' -Query "posts/$($this.Id)/attachments")  }

[object]Get_singleValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "posts/$($this.Id)/singleValueExtendedProperties")  }

[object]Get_multiValueExtendedProperties() { return (Invoke-GraphMethod -Version 'beta' -Query "posts/$($this.Id)/multiValueExtendedProperties")  }

[object]Get_mentions() { return (Invoke-GraphMethod -Version 'beta' -Query "posts/$($this.Id)/mentions")  }

}

Class microsoft_graph_inferenceClassificationOverride_beta : microsoft_graph_entity_beta {
[object]$senderEmailAddress;
[object]$classifyAs;

}

Class microsoft_graph_fieldValueSet_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_sharedDriveItem_beta : microsoft_graph_baseItem_beta {
[object]$name;
[object]$owner;

[object]Get_driveItem() { return (Invoke-GraphMethod -Version 'beta' -Query "sharedDriveItems/$($this.Id)/driveItem")  }

[object]Get_items() { return (Invoke-GraphMethod -Version 'beta' -Query "sharedDriveItems/$($this.Id)/items")  }

[object]Get_list() { return (Invoke-GraphMethod -Version 'beta' -Query "sharedDriveItems/$($this.Id)/list")  }

[object]Get_listItem() { return (Invoke-GraphMethod -Version 'beta' -Query "sharedDriveItems/$($this.Id)/listItem")  }

[object]Get_root() { return (Invoke-GraphMethod -Version 'beta' -Query "sharedDriveItems/$($this.Id)/root")  }

[object]Get_site() { return (Invoke-GraphMethod -Version 'beta' -Query "sharedDriveItems/$($this.Id)/site")  }

}

Class microsoft_graph_trending_beta : microsoft_graph_entity_beta {
[object]$resourceReference;
[object]$weight;
[object]$resourceVisualization;
[object]$lastModifiedDateTime;

[object]Get_resource() { return (Invoke-GraphMethod -Version 'beta' -Query "trendings/$($this.Id)/resource")  }

}

Class microsoft_graph_plannerTask_beta : microsoft_graph_entity_beta {
[object]$planId;
[object]$startDateTime;
[object]$activeChecklistItemCount;
[object]$bucketId;
[object]$completedDateTime;
[object]$appliedCategories;
[object]$createdDateTime;
[object]$hasDescription;
[object]$assigneePriority;
[object]$percentComplete;
[object]$title;
[object]$dueDateTime;
[object]$completedBy;
[object]$referenceCount;
[object]$orderHint;
[object]$assignments;
[object]$previewType;
[object]$checklistItemCount;
[object]$conversationThreadId;
[object]$createdBy;

[object]Get_details() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerTasks/$($this.Id)/details")  }

[object]Get_assignedToTaskBoardFormat() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerTasks/$($this.Id)/assignedToTaskBoardFormat")  }

[object]Get_progressTaskBoardFormat() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerTasks/$($this.Id)/progressTaskBoardFormat")  }

[object]Get_bucketTaskBoardFormat() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerTasks/$($this.Id)/bucketTaskBoardFormat")  }

}

Class microsoft_graph_plannerPlan_beta : microsoft_graph_entity_beta {
[object]$createdBy;
[object]$title;
[object]$createdDateTime;
[object]$owner;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerPlans/$($this.Id)/tasks")  }

[object]Get_buckets() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerPlans/$($this.Id)/buckets")  }

[object]Get_details() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerPlans/$($this.Id)/details")  }

}

Class microsoft_graph_planner_beta : microsoft_graph_entity_beta {

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "planners/$($this.Id)/tasks")  }

[object]Get_plans() { return (Invoke-GraphMethod -Version 'beta' -Query "planners/$($this.Id)/plans")  }

[object]Get_buckets() { return (Invoke-GraphMethod -Version 'beta' -Query "planners/$($this.Id)/buckets")  }

}

Class microsoft_graph_plannerBucket_beta : microsoft_graph_entity_beta {
[object]$orderHint;
[object]$name;
[object]$planId;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "plannerBuckets/$($this.Id)/tasks")  }

}

Class microsoft_graph_plannerTaskDetails_beta : microsoft_graph_entity_beta {
[object]$checklist;
[object]$description;
[object]$previewType;
[object]$references;

}

Class microsoft_graph_plannerAssignedToTaskBoardTaskFormat_beta : microsoft_graph_entity_beta {
[object]$unassignedOrderHint;
[object]$orderHintsByAssignee;

}

Class microsoft_graph_plannerProgressTaskBoardTaskFormat_beta : microsoft_graph_entity_beta {
[object]$orderHint;

}

Class microsoft_graph_plannerBucketTaskBoardTaskFormat_beta : microsoft_graph_entity_beta {
[object]$orderHint;

}

Class microsoft_graph_plannerPlanDetails_beta : microsoft_graph_entity_beta {
[object]$sharedWith;
[object]$categoryDescriptions;

}

Class microsoft_graph_taskDetails_beta : microsoft_graph_entity_beta {
[object]$checklist;
[object]$description;
[object]$completedBy;
[object]$previewType;
[object]$references;

}

Class microsoft_graph_taskBoardTaskFormat_beta : microsoft_graph_entity_beta {
[object]$orderHint;
[object]$type;

}

Class microsoft_graph_bucket_beta : microsoft_graph_entity_beta {
[object]$orderHint;
[object]$name;
[object]$planId;

[object]Get_tasks() { return (Invoke-GraphMethod -Version 'beta' -Query "buckets/$($this.Id)/tasks")  }

}

Class microsoft_graph_planDetails_beta : microsoft_graph_entity_beta {
[object]$category3Description;
[object]$category2Description;
[object]$category4Description;
[object]$category5Description;
[object]$category0Description;
[object]$category1Description;
[object]$sharedWith;

}

Class microsoft_graph_planTaskBoard_beta : microsoft_graph_entity_beta {
[object]$type;

}

Class microsoft_graph_onenoteEntityBaseModel_beta : microsoft_graph_entity_beta {
[object]$self;

}

Class microsoft_graph_onenoteEntitySchemaObjectModel_beta : microsoft_graph_onenoteEntityBaseModel_beta {
[object]$createdDateTime;

}

Class microsoft_graph_onenoteEntityHierarchyModel_beta : microsoft_graph_onenoteEntitySchemaObjectModel_beta {
[object]$createdBy;
[object]$lastModifiedDateTime;
[object]$displayName;
[object]$lastModifiedBy;

}

Class microsoft_graph_notebook_beta : microsoft_graph_onenoteEntityHierarchyModel_beta {
[object]$isShared;
[object]$sectionGroupsUrl;
[object]$sectionsUrl;
[object]$userRole;
[object]$links;
[object]$isDefault;

[object]Get_sections() { return (Invoke-GraphMethod -Version 'beta' -Query "notebooks/$($this.Id)/sections")  }

[object]Get_sectionGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "notebooks/$($this.Id)/sectionGroups")  }

}

Class microsoft_graph_onenoteSection_beta : microsoft_graph_onenoteEntityHierarchyModel_beta {
[object]$links;
[object]$isDefault;
[object]$pagesUrl;

[object]Get_parentNotebook() { return (Invoke-GraphMethod -Version 'beta' -Query "onenoteSections/$($this.Id)/parentNotebook")  }

[object]Get_parentSectionGroup() { return (Invoke-GraphMethod -Version 'beta' -Query "onenoteSections/$($this.Id)/parentSectionGroup")  }

[object]Get_pages() { return (Invoke-GraphMethod -Version 'beta' -Query "onenoteSections/$($this.Id)/pages")  }

}

Class microsoft_graph_sectionGroup_beta : microsoft_graph_onenoteEntityHierarchyModel_beta {
[object]$sectionGroupsUrl;
[object]$sectionsUrl;

[object]Get_parentNotebook() { return (Invoke-GraphMethod -Version 'beta' -Query "sectionGroups/$($this.Id)/parentNotebook")  }

[object]Get_parentSectionGroup() { return (Invoke-GraphMethod -Version 'beta' -Query "sectionGroups/$($this.Id)/parentSectionGroup")  }

[object]Get_sections() { return (Invoke-GraphMethod -Version 'beta' -Query "sectionGroups/$($this.Id)/sections")  }

[object]Get_sectionGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "sectionGroups/$($this.Id)/sectionGroups")  }

}

Class microsoft_graph_onenotePage_beta : microsoft_graph_onenoteEntitySchemaObjectModel_beta {
[object]$contentUrl;
[object]$userTags;
[object]$createdByAppId;
[object]$content;
[object]$level;
[object]$links;
[object]$lastModifiedDateTime;
[object]$order;
[object]$title;

[object]Get_parentSection() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotePages/$($this.Id)/parentSection")  }

[object]Get_parentNotebook() { return (Invoke-GraphMethod -Version 'beta' -Query "onenotePages/$($this.Id)/parentNotebook")  }

}

Class microsoft_graph_onenoteResource_beta : microsoft_graph_onenoteEntityBaseModel_beta {
[object]$content;
[object]$contentUrl;

}

Class microsoft_graph_operation_beta : microsoft_graph_entity_beta {
[object]$status;
[object]$lastActionDateTime;
[object]$createdDateTime;

}

Class microsoft_graph_onenoteOperation_beta : microsoft_graph_operation_beta {
[object]$resourceId;
[object]$error;
[object]$percentComplete;
[object]$resourceLocation;

}

Class microsoft_graph_subscription_beta : microsoft_graph_entity_beta {
[object]$clientState;
[object]$resource;
[object]$changeType;
[object]$expirationDateTime;
[object]$notificationUrl;

}

Class microsoft_graph_identityRiskEvent_beta : microsoft_graph_entity_beta {
[object]$userDisplayName;
[object]$riskEventDateTime;
[object]$userPrincipalName;
[object]$riskLevel;
[object]$riskEventStatus;
[object]$userId;
[object]$riskEventType;
[object]$closedDateTime;
[object]$createdDateTime;

[object]Get_impactedUser() { return (Invoke-GraphMethod -Version 'beta' -Query "identityRiskEvents/$($this.Id)/impactedUser")  }

}

Class microsoft_graph_locatedRiskEvent_beta : microsoft_graph_identityRiskEvent_beta {
[object]$ipAddress;
[object]$location;

}

Class microsoft_graph_impossibleTravelRiskEvent_beta : microsoft_graph_locatedRiskEvent_beta {
[object]$previousLocation;
[object]$userAgent;
[object]$isAtypicalLocation;
[object]$previousIpAddress;
[object]$previousSigninDateTime;
[object]$deviceInformation;

}

Class microsoft_graph_leakedCredentialsRiskEvent_beta : microsoft_graph_identityRiskEvent_beta {

}

Class microsoft_graph_anonymousIpRiskEvent_beta : microsoft_graph_locatedRiskEvent_beta {

}

Class microsoft_graph_suspiciousIpRiskEvent_beta : microsoft_graph_locatedRiskEvent_beta {

}

Class microsoft_graph_unfamiliarLocationRiskEvent_beta : microsoft_graph_locatedRiskEvent_beta {

}

Class microsoft_graph_malwareRiskEvent_beta : microsoft_graph_locatedRiskEvent_beta {
[object]$deviceInformation;
[object]$malwareName;

}

Class microsoft_graph_privilegedRole_beta : microsoft_graph_entity_beta {
[object]$name;

[object]Get_settings() { return (Invoke-GraphMethod -Version 'beta' -Query "privilegedRoles/$($this.Id)/settings")  }

[object]Get_assignments() { return (Invoke-GraphMethod -Version 'beta' -Query "privilegedRoles/$($this.Id)/assignments")  }

[object]Get_summary() { return (Invoke-GraphMethod -Version 'beta' -Query "privilegedRoles/$($this.Id)/summary")  }

}

Class microsoft_graph_privilegedRoleSettings_beta : microsoft_graph_entity_beta {
[object]$ticketingInfoOnElevation;
[object]$isMfaOnElevationConfigurable;
[object]$maxElavationDuration;
[object]$lastGlobalAdmin;
[object]$notificationToUserOnElevation;
[object]$minElevationDuration;
[object]$mfaOnElevation;
[object]$elevationDuration;

}

Class microsoft_graph_privilegedRoleAssignment_beta : microsoft_graph_entity_beta {
[object]$isElevated;
[object]$resultMessage;
[object]$userId;
[object]$expirationDateTime;
[object]$roleId;

[object]Get_roleInfo() { return (Invoke-GraphMethod -Version 'beta' -Query "privilegedRoleAssignments/$($this.Id)/roleInfo")  }

}

Class microsoft_graph_privilegedRoleSummary_beta : microsoft_graph_entity_beta {
[object]$status;
[object]$usersCount;
[object]$mfaEnabled;
[object]$elevatedCount;
[object]$managedCount;

}

Class microsoft_graph_privilegedOperationEvent_beta : microsoft_graph_entity_beta {
[object]$requestorName;
[object]$tenantId;
[object]$additionalInformation;
[object]$requestorId;
[object]$creationDateTime;
[object]$userName;
[object]$referenceSystem;
[object]$userId;
[object]$requestType;
[object]$referenceKey;
[object]$expirationDateTime;
[object]$roleName;
[object]$roleId;
[object]$userMail;

}

Class microsoft_graph_privilegedSignupStatus_beta : microsoft_graph_entity_beta {
[object]$isRegistered;
[object]$status;

}

Class microsoft_graph_tenantSetupInfo_beta : microsoft_graph_entity_beta {
[object]$relevantRolesSettings;
[object]$skipSetup;
[object]$userRolesActions;
[object]$firstTimeSetup;
[object]$setupStatus;

[object]Get_defaultRolesSettings() { return (Invoke-GraphMethod -Version 'beta' -Query "tenantSetupInfos/$($this.Id)/defaultRolesSettings")  }

}

Class microsoft_graph_connector_beta : microsoft_graph_entity_beta {
[object]$status;
[object]$machineName;
[object]$externalIp;

[object]Get_memberOf() { return (Invoke-GraphMethod -Version 'beta' -Query "connectors/$($this.Id)/memberOf")  }

}

Class microsoft_graph_invitation_beta : microsoft_graph_entity_beta {
[object]$invitedUserMessageInfo;
[object]$invitedUserType;
[object]$sendInvitationMessage;
[object]$invitedUserEmailAddress;
[object]$inviteRedeemUrl;
[object]$invitedUserDisplayName;
[object]$status;
[object]$inviteRedirectUrl;

[object]Get_invitedUser() { return (Invoke-GraphMethod -Version 'beta' -Query "invitations/$($this.Id)/invitedUser")  }

}

Class microsoft_graph_deviceManagement_beta : microsoft_graph_entity_beta {
[object]$subscriptionState;
[object]$settings;

[object]Get_termsAndConditions() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/termsAndConditions")  }

[object]Get_androidForWorkSettings() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/androidForWorkSettings")  }

[object]Get_androidForWorkAppConfigurationSchemas() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/androidForWorkAppConfigurationSchemas")  }

[object]Get_enrollmentProfiles() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/enrollmentProfiles")  }

[object]Get_importedDeviceIdentities() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/importedDeviceIdentities")  }

[object]Get_importedAppleDeviceIdentities() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/importedAppleDeviceIdentities")  }

[object]Get_remoteActionAudits() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/remoteActionAudits")  }

[object]Get_applePushNotificationCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/applePushNotificationCertificate")  }

[object]Get_deviceManagementScripts() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/deviceManagementScripts")  }

[object]Get_managedDeviceOverview() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/managedDeviceOverview")  }

[object]Get_deviceConfigurations() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/deviceConfigurations")  }

[object]Get_deviceCompliancePolicies() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/deviceCompliancePolicies")  }

[object]Get_softwareUpdateStatusSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/softwareUpdateStatusSummary")  }

[object]Get_cloudPkiSubscriptions() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/cloudPkiSubscriptions")  }

[object]Get_deviceCompliancePolicyDeviceStateSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/deviceCompliancePolicyDeviceStateSummary")  }

[object]Get_complianceSettingStateSummaries() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/complianceSettingStateSummaries")  }

[object]Get_deviceConfigurationDeviceStateSummaries() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/deviceConfigurationDeviceStateSummaries")  }

[object]Get_deviceCategories() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/deviceCategories")  }

[object]Get_exchangeConnectors() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/exchangeConnectors")  }

[object]Get_exchangeOnPremisesPolicy() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/exchangeOnPremisesPolicy")  }

[object]Get_mobileThreatDefenseConnectors() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/mobileThreatDefenseConnectors")  }

[object]Get_notificationMessageTemplates() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/notificationMessageTemplates")  }

[object]Get_roleDefinitions() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/roleDefinitions")  }

[object]Get_roleAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/roleAssignments")  }

[object]Get_resourceOperations() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/resourceOperations")  }

[object]Get_telecomExpenseManagementPartners() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagements/$($this.Id)/telecomExpenseManagementPartners")  }

}

Class microsoft_graph_termsAndConditions_beta : microsoft_graph_entity_beta {
[object]$description;
[object]$acceptanceStatement;
[object]$modifiedDateTime;
[object]$createdDateTime;
[object]$bodyText;
[object]$version;
[object]$title;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "termsAndConditionss/$($this.Id)/groupAssignments")  }

[object]Get_acceptanceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "termsAndConditionss/$($this.Id)/acceptanceStatuses")  }

}

Class microsoft_graph_androidForWorkSettings_beta : microsoft_graph_entity_beta {
[object]$lastAppSyncStatus;
[object]$bindStatus;
[object]$targetGroupIds;
[object]$lastAppSyncDateTime;
[object]$ownerOrganizationName;
[object]$lastModifiedDateTime;
[object]$enrollmentTarget;
[object]$ownerUserPrincipalName;

}

Class microsoft_graph_androidForWorkAppConfigurationSchema_beta : microsoft_graph_entity_beta {
[object]$exampleJson;
[object]$schemaItems;

}

Class microsoft_graph_enrollmentProfile_beta : microsoft_graph_entity_beta {
[object]$description;
[object]$displayName;
[object]$configurationEndpointUrl;
[object]$requiresUserAuthentication;

}

Class microsoft_graph_importedDeviceIdentity_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$importedDeviceIdentifier;
[object]$description;
[object]$platform;
[object]$lastContactedDateTime;
[object]$enrollmentState;
[object]$createdDateTime;
[object]$importedDeviceIdentityType;

}

Class microsoft_graph_importedAppleDeviceIdentity_beta : microsoft_graph_entity_beta {
[object]$requestedEnrollmentProfileId;
[object]$description;
[object]$isSupervised;
[object]$discoverySource;
[object]$lastContactedDateTime;
[object]$serialNumber;
[object]$requestedEnrollmentProfileAssignmentDateTime;
[object]$createdDateTime;
[object]$platform;
[object]$enrollmentState;

}

Class microsoft_graph_remoteActionAudit_beta : microsoft_graph_entity_beta {
[object]$action;
[object]$userName;
[object]$deviceDisplayName;
[object]$initiatedByUserPrincipalName;
[object]$deviceOwnerUserPrincipalName;
[object]$requestDateTime;
[object]$actionState;
[object]$deviceIMEI;

}

Class microsoft_graph_applePushNotificationCertificate_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$certificateUploadStatus;
[object]$topicIdentifier;
[object]$certificate;
[object]$expirationDateTime;
[object]$appleIdentifier;
[object]$certificateUploadFailureReason;

}

Class microsoft_graph_deviceManagementScript_beta : microsoft_graph_entity_beta {
[object]$runSchedule;
[object]$scriptContent;
[object]$description;
[object]$createdDateTime;
[object]$lastModifiedDateTime;
[object]$runAsAccount;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagementScripts/$($this.Id)/groupAssignments")  }

[object]Get_runStates() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagementScripts/$($this.Id)/runStates")  }

}

Class microsoft_graph_managedDeviceOverview_beta : microsoft_graph_entity_beta {
[object]$deviceOperatingSystemSummary;
[object]$dualEnrolledDeviceCount;
[object]$deviceExchangeAccessStateSummary;
[object]$mdmEnrolledCount;
[object]$enrolledDeviceCount;

}

Class microsoft_graph_deviceConfiguration_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$description;
[object]$createdDateTime;
[object]$version;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurations/$($this.Id)/groupAssignments")  }

[object]Get_deviceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurations/$($this.Id)/deviceStatuses")  }

[object]Get_userStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurations/$($this.Id)/userStatuses")  }

[object]Get_deviceStatusOverview() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurations/$($this.Id)/deviceStatusOverview")  }

[object]Get_userStatusOverview() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurations/$($this.Id)/userStatusOverview")  }

[object]Get_deviceSettingStateSummaries() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurations/$($this.Id)/deviceSettingStateSummaries")  }

}

Class microsoft_graph_deviceCompliancePolicy_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$description;
[object]$createdDateTime;
[object]$version;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/groupAssignments")  }

[object]Get_scheduledActionsForRule() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/scheduledActionsForRule")  }

[object]Get_deviceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/deviceStatuses")  }

[object]Get_userStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/userStatuses")  }

[object]Get_deviceStatusOverview() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/deviceStatusOverview")  }

[object]Get_userStatusOverview() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/userStatusOverview")  }

[object]Get_deviceSettingStateSummaries() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicys/$($this.Id)/deviceSettingStateSummaries")  }

}

Class microsoft_graph_softwareUpdateStatusSummary_beta : microsoft_graph_entity_beta {
[object]$conflictDeviceCount;
[object]$notApplicableDeviceCount;
[object]$remediatedDeviceCount;
[object]$errorDeviceCount;
[object]$compliantDeviceCount;
[object]$unknownDeviceCount;
[object]$nonCompliantDeviceCount;
[object]$displayName;

}

Class microsoft_graph_cloudPkiSubscription_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$description;
[object]$syncStatus;
[object]$cloudPkiProvider;
[object]$lastSyncDateTime;
[object]$createdDateTime;
[object]$trustedRootCertificate;
[object]$version;
[object]$lastSyncError;
[object]$credentials;
[object]$displayName;

}

Class microsoft_graph_deviceCompliancePolicyDeviceStateSummary_beta : microsoft_graph_entity_beta {
[object]$conflictDeviceCount;
[object]$notApplicableDeviceCount;
[object]$remediatedDeviceCount;
[object]$errorDeviceCount;
[object]$compliantDeviceCount;
[object]$unknownDeviceCount;
[object]$nonCompliantDeviceCount;

}

Class microsoft_graph_complianceSettingStateSummary_beta : microsoft_graph_entity_beta {
[object]$settingPlatform;
[object]$notApplicableDeviceCount;
[object]$instanceDisplayName;
[object]$conflictDeviceCount;
[object]$remediatedDeviceCount;
[object]$settingName;
[object]$compliantDeviceCount;
[object]$unknownDeviceCount;
[object]$nonCompliantDeviceCount;
[object]$errorDeviceCount;

}

Class microsoft_graph_deviceConfigurationDeviceStateSummary_beta : microsoft_graph_entity_beta {
[object]$conflictDeviceCount;
[object]$notApplicableDeviceCount;
[object]$remediatedDeviceCount;
[object]$errorDeviceCount;
[object]$compliantDeviceCount;
[object]$unknownDeviceCount;
[object]$nonCompliantDeviceCount;

}

Class microsoft_graph_deviceCategory_beta : microsoft_graph_entity_beta {
[object]$displayName;
[object]$description;

}

Class microsoft_graph_deviceManagementExchangeConnector_beta : microsoft_graph_entity_beta {
[object]$exchangeConnectorType;
[object]$status;
[object]$serverName;
[object]$primarySmtpAddress;
[object]$lastSyncDateTime;

}

Class microsoft_graph_deviceManagementExchangeOnPremisesPolicy_beta : microsoft_graph_entity_beta {
[object]$knownDeviceClasses;
[object]$accessRules;
[object]$notificationContent;
[object]$defaultAccessLevel;

[object]Get_conditionalAccessSettings() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagementExchangeOnPremisesPolicys/$($this.Id)/conditionalAccessSettings")  }

}

Class microsoft_graph_mobileThreatDefenseConnector_beta : microsoft_graph_entity_beta {
[object]$androidEnabled;
[object]$partnerUnresponsivenessThresholdInDays;
[object]$partnerUnsupportedOsVersionBlocked;
[object]$partnerState;
[object]$iosEnabled;
[object]$iosDeviceBlockedOnMissingPartnerData;
[object]$lastHeartbeatDateTime;
[object]$androidDeviceBlockedOnMissingPartnerData;

}

Class microsoft_graph_notificationMessageTemplate_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$displayName;
[object]$defaultLocale;
[object]$brandingOptions;

[object]Get_localizedNotificationMessages() { return (Invoke-GraphMethod -Version 'beta' -Query "notificationMessageTemplates/$($this.Id)/localizedNotificationMessages")  }

}

Class microsoft_graph_roleDefinition_beta : microsoft_graph_entity_beta {
[object]$description;
[object]$displayName;
[object]$isBuiltInRoleDefinition;
[object]$permissions;

[object]Get_roleAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "roleDefinitions/$($this.Id)/roleAssignments")  }

}

Class microsoft_graph_roleAssignment_beta : microsoft_graph_entity_beta {
[object]$description;
[object]$displayName;
[object]$members;
[object]$scopeMembers;

[object]Get_roleDefinition() { return (Invoke-GraphMethod -Version 'beta' -Query "roleAssignments/$($this.Id)/roleDefinition")  }

}

Class microsoft_graph_resourceOperation_beta : microsoft_graph_entity_beta {
[object]$resourceName;
[object]$description;
[object]$actionName;

}

Class microsoft_graph_telecomExpenseManagementPartner_beta : microsoft_graph_entity_beta {
[object]$url;
[object]$displayName;
[object]$lastConnectionDateTime;
[object]$enabled;
[object]$appAuthorized;

}

Class microsoft_graph_deviceAppManagement_beta : microsoft_graph_entity_beta {
[object]$windowsManagementAppEnabled;
[object]$windowsStoreForBusinessLanguage;
[object]$windowsStoreForBusinessLastCompletedApplicationSyncTime;
[object]$windowsStoreForBusinessLastSuccessfulSyncDateTime;
[object]$isEnabledForWindowsStoreForBusiness;

[object]Get_mobileApps() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/mobileApps")  }

[object]Get_mobileAppCategories() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/mobileAppCategories")  }

[object]Get_enterpriseCodeSigningCertificates() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/enterpriseCodeSigningCertificates")  }

[object]Get_iosLobAppProvisioningConfigurations() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/iosLobAppProvisioningConfigurations")  }

[object]Get_symantecCodeSigningCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/symantecCodeSigningCertificate")  }

[object]Get_windowsManagementApp() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/windowsManagementApp")  }

[object]Get_sideLoadingKeys() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/sideLoadingKeys")  }

[object]Get_managedAppPolicies() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/managedAppPolicies")  }

[object]Get_iosManagedAppProtections() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/iosManagedAppProtections")  }

[object]Get_androidManagedAppProtections() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/androidManagedAppProtections")  }

[object]Get_defaultManagedAppProtections() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/defaultManagedAppProtections")  }

[object]Get_targetedManagedAppConfigurations() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/targetedManagedAppConfigurations")  }

[object]Get_mdmWindowsInformationProtectionPolicies() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/mdmWindowsInformationProtectionPolicies")  }

[object]Get_windowsInformationProtectionPolicies() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/windowsInformationProtectionPolicies")  }

[object]Get_managedAppRegistrations() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/managedAppRegistrations")  }

[object]Get_managedAppStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/managedAppStatuses")  }

[object]Get_managedEBooks() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceAppManagements/$($this.Id)/managedEBooks")  }

}

Class microsoft_graph_mobileApp_beta : microsoft_graph_entity_beta {
[object]$developer;
[object]$displayName;
[object]$lastModifiedDateTime;
[object]$createdDateTime;
[object]$privacyInformationUrl;
[object]$notes;
[object]$informationUrl;
[object]$owner;
[object]$publisher;
[object]$largeIcon;
[object]$description;
[object]$uploadState;
[object]$isFeatured;

[object]Get_categories() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileApps/$($this.Id)/categories")  }

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileApps/$($this.Id)/groupAssignments")  }

[object]Get_installSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileApps/$($this.Id)/installSummary")  }

[object]Get_deviceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileApps/$($this.Id)/deviceStatuses")  }

[object]Get_userStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileApps/$($this.Id)/userStatuses")  }

}

Class microsoft_graph_mobileAppCategory_beta : microsoft_graph_entity_beta {
[object]$displayName;
[object]$lastModifiedDateTime;

}

Class microsoft_graph_enterpriseCodeSigningCertificate_beta : microsoft_graph_entity_beta {
[object]$subjectName;
[object]$issuer;
[object]$content;
[object]$issuerName;
[object]$expirationDateTime;
[object]$subject;
[object]$uploadDateTime;
[object]$status;

}

Class microsoft_graph_iosLobAppProvisioningConfiguration_beta : microsoft_graph_entity_beta {
[object]$payloadFileName;
[object]$description;
[object]$payload;
[object]$version;
[object]$createdDateTime;
[object]$expirationDateTime;
[object]$lastModifiedDateTime;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "iosLobAppProvisioningConfigurations/$($this.Id)/groupAssignments")  }

[object]Get_deviceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "iosLobAppProvisioningConfigurations/$($this.Id)/deviceStatuses")  }

[object]Get_userStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "iosLobAppProvisioningConfigurations/$($this.Id)/userStatuses")  }

}

Class microsoft_graph_symantecCodeSigningCertificate_beta : microsoft_graph_entity_beta {
[object]$subjectName;
[object]$issuer;
[object]$uploadDateTime;
[object]$password;
[object]$issuerName;
[object]$expirationDateTime;
[object]$subject;
[object]$content;
[object]$status;

}

Class microsoft_graph_windowsManagementApp_beta : microsoft_graph_entity_beta {
[object]$deployedVersion;
[object]$lastModifiedTime;
[object]$onboardingStatus;

[object]Get_healthStates() { return (Invoke-GraphMethod -Version 'beta' -Query "windowsManagementApps/$($this.Id)/healthStates")  }

}

Class microsoft_graph_sideLoadingKey_beta : microsoft_graph_entity_beta {
[object]$lastUpdatedDateTime;
[object]$totalActivation;
[object]$description;
[object]$displayName;
[object]$value;

}

Class microsoft_graph_managedAppPolicy_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$description;
[object]$version;
[object]$lastModifiedTime;
[object]$createdDateTime;
[object]$deployedAppCount;
[object]$displayName;

[object]Get_mobileAppIdentifierDeployments() { return (Invoke-GraphMethod -Version 'beta' -Query "managedAppPolicys/$($this.Id)/mobileAppIdentifierDeployments")  }

[object]Get_deploymentSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "managedAppPolicys/$($this.Id)/deploymentSummary")  }

}

Class microsoft_graph_managedAppProtection_beta : microsoft_graph_managedAppPolicy_beta {
[object]$disableAppPinIfDevicePinIsSet;
[object]$simplePinBlocked;
[object]$saveAsBlocked;
[object]$periodOnlineBeforeAccessCheck;
[object]$managedBrowserToOpenLinksRequired;
[object]$printBlocked;
[object]$dataBackupBlocked;
[object]$contactSyncBlocked;
[object]$allowedInboundDataTransferSources;
[object]$fingerprintBlocked;
[object]$pinRequired;
[object]$organizationalCredentialsRequired;
[object]$pinCharacterSet;
[object]$maximumPinRetries;
[object]$allowedOutboundDataTransferDestinations;
[object]$deviceComplianceRequired;
[object]$allowedDataStorageLocations;
[object]$minimumWarningOsVersion;
[object]$periodOfflineBeforeAccessCheck;
[object]$minimumRequiredAppVersion;
[object]$minimumPinLength;
[object]$minimumWarningAppVersion;
[object]$minimumRequiredOsVersion;
[object]$allowedOutboundClipboardSharingLevel;
[object]$periodOfflineBeforeWipeIsEnforced;

}

Class microsoft_graph_targetedManagedAppProtection_beta : microsoft_graph_managedAppProtection_beta {
[object]$targetedSecurityGroupIds;
[object]$targetedSecurityGroupsCount;

[object]Get_targetedSecurityGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "targetedManagedAppProtections/$($this.Id)/targetedSecurityGroups")  }

}

Class microsoft_graph_iosManagedAppProtection_beta : microsoft_graph_targetedManagedAppProtection_beta {
[object]$appDataEncryptionType;
[object]$minimumRequiredSdkVersion;

}

Class microsoft_graph_androidManagedAppProtection_beta : microsoft_graph_targetedManagedAppProtection_beta {
[object]$encryptAppData;
[object]$screenCaptureBlocked;

}

Class microsoft_graph_defaultManagedAppProtection_beta : microsoft_graph_managedAppProtection_beta {
[object]$appDataEncryptionType;
[object]$minimumRequiredSdkVersion;
[object]$screenCaptureBlocked;
[object]$customSettings;
[object]$encryptAppData;

}

Class microsoft_graph_managedAppConfiguration_beta : microsoft_graph_managedAppPolicy_beta {
[object]$customSettings;

}

Class microsoft_graph_targetedManagedAppConfiguration_beta : microsoft_graph_managedAppConfiguration_beta {
[object]$targetedSecurityGroupIds;
[object]$targetedSecurityGroupsCount;

[object]Get_targetedSecurityGroups() { return (Invoke-GraphMethod -Version 'beta' -Query "targetedManagedAppConfigurations/$($this.Id)/targetedSecurityGroups")  }

}

Class microsoft_graph_windowsInformationProtection_beta : microsoft_graph_managedAppPolicy_beta {
[object]$enterpriseNetworkDomainNames;
[object]$exemptApps;
[object]$enterpriseProxyServers;
[object]$protectionUnderLockConfigRequired;
[object]$azureRightsManagementServicesAllowed;
[object]$enforcementLevel;
[object]$allowedApps;
[object]$targetedSecurityGroupIds;
[object]$enterpriseDomain;
[object]$enterpriseIPRanges;
[object]$enterpriseProxyServersAreAuthoritative;
[object]$dataRecoveryCertificate;
[object]$iconsVisible;
[object]$enterpriseCloudResources;
[object]$enterpriseInternalProxyServers;
[object]$enterpriseProtectedDomainNames;
[object]$rightsManagementServicesTemplateId;
[object]$enterpriseIPRangesAreAuthoritative;
[object]$revokeOnUnenrollDisabled;
[object]$neutralDomainResources;

[object]Get_allowedAppLockerFiles() { return (Invoke-GraphMethod -Version 'beta' -Query "windowsInformationProtections/$($this.Id)/allowedAppLockerFiles")  }

[object]Get_exemptAppLockerFiles() { return (Invoke-GraphMethod -Version 'beta' -Query "windowsInformationProtections/$($this.Id)/exemptAppLockerFiles")  }

}

Class microsoft_graph_mdmWindowsInformationProtectionPolicy_beta : microsoft_graph_windowsInformationProtection_beta {

}

Class microsoft_graph_windowsInformationProtectionPolicy_beta : microsoft_graph_windowsInformationProtection_beta {
[object]$numberOfPastPinsRemembered;
[object]$mdmEnrollmentUrl;
[object]$pinExpirationDays;
[object]$minutesOfInactivityBeforeDeviceLock;
[object]$windowsHelloForBusinessBlocked;
[object]$pinMinimumLength;
[object]$pinLowercaseLetters;
[object]$pinUppercaseLetters;
[object]$pinSpecialCharacters;
[object]$revokeOnMdmHandoffDisabled;
[object]$passwordMaximumAttemptCount;

}

Class microsoft_graph_managedAppStatus_beta : microsoft_graph_entity_beta {
[object]$displayName;
[object]$version;

}

Class microsoft_graph_managedEBook_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$description;
[object]$informationUrl;
[object]$largeCover;
[object]$privacyInformationUrl;
[object]$createdDateTime;
[object]$publisher;
[object]$publishedDateTime;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "managedEBooks/$($this.Id)/groupAssignments")  }

[object]Get_deviceStates() { return (Invoke-GraphMethod -Version 'beta' -Query "managedEBooks/$($this.Id)/deviceStates")  }

[object]Get_userStateSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "managedEBooks/$($this.Id)/userStateSummary")  }

}

Class microsoft_graph_managedDeviceMobileAppConfiguration_beta : microsoft_graph_entity_beta {
[object]$targetedMobileApps;
[object]$description;
[object]$version;
[object]$settingXml;
[object]$createdDateTime;
[object]$lastModifiedDateTime;
[object]$settings;
[object]$displayName;

[object]Get_groupAssignments() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDeviceMobileAppConfigurations/$($this.Id)/groupAssignments")  }

[object]Get_deviceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDeviceMobileAppConfigurations/$($this.Id)/deviceStatuses")  }

[object]Get_userStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDeviceMobileAppConfigurations/$($this.Id)/userStatuses")  }

[object]Get_deviceStatusSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDeviceMobileAppConfigurations/$($this.Id)/deviceStatusSummary")  }

[object]Get_userStatusSummary() { return (Invoke-GraphMethod -Version 'beta' -Query "managedDeviceMobileAppConfigurations/$($this.Id)/userStatusSummary")  }

}

Class microsoft_graph_mdmAppConfigGroupAssignment_beta : microsoft_graph_entity_beta {
[object]$appConfiguration;
[object]$targetGroupId;

}

Class microsoft_graph_managedDeviceMobileAppConfigurationDeviceStatus_beta : microsoft_graph_entity_beta {
[object]$status;
[object]$deviceDisplayName;
[object]$userPrincipalName;
[object]$lastReportedDateTime;

}

Class microsoft_graph_managedDeviceMobileAppConfigurationUserStatus_beta : microsoft_graph_entity_beta {
[object]$userDisplayName;
[object]$devicesCount;
[object]$status;
[object]$lastReportedDateTime;
[object]$userPrincipalName;

}

Class microsoft_graph_managedDeviceMobileAppConfigurationDeviceSummary_beta : microsoft_graph_entity_beta {
[object]$configurationVersion;
[object]$failedCount;
[object]$errorCount;
[object]$pendingCount;
[object]$lastUpdateDateTime;
[object]$successCount;

}

Class microsoft_graph_managedDeviceMobileAppConfigurationUserSummary_beta : microsoft_graph_entity_beta {
[object]$configurationVersion;
[object]$failedCount;
[object]$errorCount;
[object]$pendingCount;
[object]$lastUpdateDateTime;
[object]$successCount;

}

Class microsoft_graph_mobileAppGroupAssignment_beta : microsoft_graph_entity_beta {
[object]$targetGroupId;
[object]$installIntent;
[object]$vpnConfigurationId;

[object]Get_app() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileAppGroupAssignments/$($this.Id)/app")  }

}

Class microsoft_graph_mobileAppInstallSummary_beta : microsoft_graph_entity_beta {
[object]$notInstalledDeviceCount;
[object]$installedUserCount;
[object]$failedUserCount;
[object]$failedDeviceCount;
[object]$notInstalledUserCount;
[object]$installedDeviceCount;

}

Class microsoft_graph_mobileAppInstallStatus_beta : microsoft_graph_entity_beta {
[object]$lastSyncDateTime;
[object]$userName;
[object]$mobileAppInstallStatusValue;
[object]$deviceName;
[object]$osVersion;
[object]$errorCode;
[object]$deviceId;
[object]$osDescription;

[object]Get_app() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileAppInstallStatuss/$($this.Id)/app")  }

}

Class microsoft_graph_userAppInstallStatus_beta : microsoft_graph_entity_beta {
[object]$userName;
[object]$failedDeviceCount;
[object]$notInstalledDeviceCount;
[object]$installedDeviceCount;

[object]Get_app() { return (Invoke-GraphMethod -Version 'beta' -Query "userAppInstallStatuss/$($this.Id)/app")  }

[object]Get_deviceStatuses() { return (Invoke-GraphMethod -Version 'beta' -Query "userAppInstallStatuss/$($this.Id)/deviceStatuses")  }

}

Class microsoft_graph_mobileAppContentFile_beta : microsoft_graph_entity_beta {
[object]$uploadState;
[object]$azureStorageUriExpirationDateTime;
[object]$size;
[object]$isCommitted;
[object]$azureStorageUri;
[object]$createdDateTime;
[object]$name;
[object]$manifest;
[object]$sizeEncrypted;

}

Class microsoft_graph_mobileAppProvisioningConfigGroupAssignment_beta : microsoft_graph_entity_beta {
[object]$targetGroupId;

}

Class microsoft_graph_mobileAppVppGroupAssignment_beta : microsoft_graph_mobileAppGroupAssignment_beta {
[object]$useDeviceLicensing;

}

Class microsoft_graph_officeSuiteApp_beta : microsoft_graph_mobileApp_beta {
[object]$excludedApps;
[object]$productIds;
[object]$autoAcceptEula;

}

Class microsoft_graph_managedApp_beta : microsoft_graph_mobileApp_beta {
[object]$appAvailability;
[object]$version;

}

Class microsoft_graph_managedAndroidStoreApp_beta : microsoft_graph_managedApp_beta {
[object]$packageId;

}

Class microsoft_graph_managedIOSStoreApp_beta : microsoft_graph_managedApp_beta {
[object]$bundleId;

}

Class microsoft_graph_managedMobileLobApp_beta : microsoft_graph_managedApp_beta {
[object]$committedContentVersion;
[object]$identityVersion;
[object]$fileName;
[object]$size;

[object]Get_contentVersions() { return (Invoke-GraphMethod -Version 'beta' -Query "managedMobileLobApps/$($this.Id)/contentVersions")  }

}

Class microsoft_graph_mobileAppContent_beta : microsoft_graph_entity_beta {

[object]Get_files() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileAppContents/$($this.Id)/files")  }

}

Class microsoft_graph_managedAndroidLobApp_beta : microsoft_graph_managedMobileLobApp_beta {
[object]$identityName;
[object]$minimumSupportedOperatingSystem;

}

Class microsoft_graph_managedIOSLobApp_beta : microsoft_graph_managedMobileLobApp_beta {
[object]$bundleId;
[object]$minimumSupportedOperatingSystem;
[object]$applicableDeviceType;
[object]$expirationDateTime;

}

Class microsoft_graph_mobileLobApp_beta : microsoft_graph_mobileApp_beta {
[object]$committedContentVersion;
[object]$identityVersion;
[object]$fileName;
[object]$size;

[object]Get_contentVersions() { return (Invoke-GraphMethod -Version 'beta' -Query "mobileLobApps/$($this.Id)/contentVersions")  }

}

Class microsoft_graph_windowsMobileMSI_beta : microsoft_graph_mobileLobApp_beta {
[object]$commandLine;
[object]$productCode;

}

Class microsoft_graph_windowsPhone81AppX_beta : microsoft_graph_mobileLobApp_beta {
[object]$minimumSupportedOperatingSystem;
[object]$identityPublisherHash;
[object]$identityResourceIdentifier;
[object]$identityName;
[object]$phoneProductIdentifier;
[object]$applicableArchitectures;
[object]$phonePublisherId;

}

Class microsoft_graph_windowsPhone81AppXBundle_beta : microsoft_graph_windowsPhone81AppX_beta {
[object]$appXPackageInformationList;

}

Class microsoft_graph_windowsUniversalAppX_beta : microsoft_graph_mobileLobApp_beta {
[object]$minimumSupportedOperatingSystem;
[object]$applicableDeviceTypes;
[object]$identityPublisherHash;
[object]$isBundle;
[object]$identityResourceIdentifier;
[object]$identityName;
[object]$applicableArchitectures;

}

Class microsoft_graph_windowsAppX_beta : microsoft_graph_mobileLobApp_beta {
[object]$minimumSupportedOperatingSystem;
[object]$identityPublisherHash;
[object]$isBundle;
[object]$identityResourceIdentifier;
[object]$identityName;
[object]$applicableArchitectures;

}

Class microsoft_graph_windowsPhoneXAP_beta : microsoft_graph_mobileLobApp_beta {
[object]$minimumSupportedOperatingSystem;
[object]$productIdentifier;

}

Class microsoft_graph_androidLobApp_beta : microsoft_graph_mobileLobApp_beta {
[object]$identityName;
[object]$minimumSupportedOperatingSystem;

}

Class microsoft_graph_iosLobApp_beta : microsoft_graph_mobileLobApp_beta {
[object]$bundleId;
[object]$minimumSupportedOperatingSystem;
[object]$applicableDeviceType;
[object]$expirationDateTime;

}

Class microsoft_graph_androidForWorkApp_beta : microsoft_graph_mobileApp_beta {
[object]$appStoreUrl;
[object]$usedLicenseCount;
[object]$appIdentifier;
[object]$totalLicenseCount;

}

Class microsoft_graph_webApp_beta : microsoft_graph_mobileApp_beta {
[object]$appUrl;
[object]$useManagedBrowser;

}

Class microsoft_graph_windowsPhone81StoreApp_beta : microsoft_graph_mobileApp_beta {
[object]$appStoreUrl;

}

Class microsoft_graph_windowsStoreApp_beta : microsoft_graph_mobileApp_beta {
[object]$appStoreUrl;

}

Class microsoft_graph_androidStoreApp_beta : microsoft_graph_mobileApp_beta {
[object]$minimumSupportedOperatingSystem;
[object]$appStoreUrl;
[object]$appIdentifier;

}

Class microsoft_graph_iosVppApp_beta : microsoft_graph_mobileApp_beta {
[object]$appStoreUrl;
[object]$releaseDateTime;
[object]$licensingType;
[object]$usedLicenseCount;
[object]$applicableDeviceType;
[object]$totalLicenseCount;

[object]Get_vppToken() { return (Invoke-GraphMethod -Version 'beta' -Query "iosVppApps/$($this.Id)/vppToken")  }

}

Class microsoft_graph_iosStoreApp_beta : microsoft_graph_mobileApp_beta {
[object]$bundleId;
[object]$appStoreUrl;
[object]$minimumSupportedOperatingSystem;
[object]$applicableDeviceType;

}

Class microsoft_graph_windowsStoreForBusinessApp_beta : microsoft_graph_mobileApp_beta {
[object]$licenseType;
[object]$usedLicenseCount;
[object]$totalLicenseCount;
[object]$productKey;

}

Class microsoft_graph_appReportingOverviewStatus_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_iosMobileAppConfiguration_beta : microsoft_graph_managedDeviceMobileAppConfiguration_beta {

}

Class microsoft_graph_termsAndConditionsGroupAssignment_beta : microsoft_graph_entity_beta {
[object]$targetGroupId;

[object]Get_termsAndConditions() { return (Invoke-GraphMethod -Version 'beta' -Query "termsAndConditionsGroupAssignments/$($this.Id)/termsAndConditions")  }

}

Class microsoft_graph_termsAndConditionsAcceptanceStatus_beta : microsoft_graph_entity_beta {
[object]$userDisplayName;
[object]$acceptedVersion;
[object]$acceptedDateTime;

[object]Get_termsAndConditions() { return (Invoke-GraphMethod -Version 'beta' -Query "termsAndConditionsAcceptanceStatuss/$($this.Id)/termsAndConditions")  }

}

Class microsoft_graph_importedDeviceIdentityResult_beta : microsoft_graph_importedDeviceIdentity_beta {
[object]$status;

}

Class microsoft_graph_importedAppleDeviceIdentityResult_beta : microsoft_graph_importedAppleDeviceIdentity_beta {
[object]$status;

}

Class microsoft_graph_depEnrollmentProfile_beta : microsoft_graph_enrollmentProfile_beta {
[object]$restoreFromAndroidDisabled;
[object]$macOSFileVaultDisabled;
[object]$restoreBlocked;
[object]$supervisedModeEnabled;
[object]$sharedIPadMaximumUserCount;
[object]$zoomDisabled;
[object]$enableSharedIPad;
[object]$touchIdDisabled;
[object]$iTunesPairingMode;
[object]$supportPhoneNumber;
[object]$termsAndConditionsDisabled;
[object]$diagnosticsDisabled;
[object]$isMandatory;
[object]$locationDisabled;
[object]$passCodeDisabled;
[object]$supportDepartment;
[object]$applePayDisabled;
[object]$macOSRegistrationDisabled;
[object]$managementCertificates;
[object]$awaitDeviceConfiguredConfirmation;
[object]$appleIdDisabled;
[object]$profileRemovalDisabled;
[object]$siriDisabled;

}

Class microsoft_graph_deviceConfigurationState_beta : microsoft_graph_entity_beta {
[object]$version;
[object]$settingStates;
[object]$platformType;
[object]$state;
[object]$settingCount;
[object]$displayName;

}

Class microsoft_graph_detectedApp_beta : microsoft_graph_entity_beta {
[object]$sizeInByte;
[object]$displayName;
[object]$version;
[object]$deviceCount;

[object]Get_managedDevices() { return (Invoke-GraphMethod -Version 'beta' -Query "detectedApps/$($this.Id)/managedDevices")  }

}

Class microsoft_graph_deviceCompliancePolicyState_beta : microsoft_graph_entity_beta {
[object]$version;
[object]$settingStates;
[object]$platformType;
[object]$state;
[object]$settingCount;
[object]$displayName;

}

Class microsoft_graph_deviceManagementScriptGroupAssignment_beta : microsoft_graph_entity_beta {
[object]$targetGroupId;

}

Class microsoft_graph_deviceManagementScriptState_beta : microsoft_graph_entity_beta {
[object]$lastStateUpdateDateTime;
[object]$runState;
[object]$resultMessage;

[object]Get_managedDevice() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagementScriptStates/$($this.Id)/managedDevice")  }

[object]Get_user() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceManagementScriptStates/$($this.Id)/user")  }

}

Class microsoft_graph_windowsManagementAppHealthState_beta : microsoft_graph_entity_beta {
[object]$installedVersion;
[object]$deviceName;
[object]$lastCheckInTime;
[object]$healthStatus;
[object]$deviceOSVersion;

}

Class microsoft_graph_reportRoot_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_deviceConfigurationAssignment_beta : microsoft_graph_entity_beta {

[object]Get_deviceConfiguration() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceConfigurationAssignments/$($this.Id)/deviceConfiguration")  }

}

Class microsoft_graph_deviceConfigurationGroupAssignment_beta : microsoft_graph_deviceConfigurationAssignment_beta {
[object]$excludeGroup;
[object]$targetGroupId;

}

Class microsoft_graph_deviceConfigurationDeviceStatus_beta : microsoft_graph_entity_beta {
[object]$status;
[object]$deviceDisplayName;
[object]$userPrincipalName;
[object]$lastReportedDateTime;

}

Class microsoft_graph_deviceConfigurationUserStatus_beta : microsoft_graph_entity_beta {
[object]$userDisplayName;
[object]$devicesCount;
[object]$status;
[object]$lastReportedDateTime;
[object]$userPrincipalName;

}

Class microsoft_graph_deviceConfigurationDeviceOverview_beta : microsoft_graph_entity_beta {
[object]$configurationVersion;
[object]$failedCount;
[object]$errorCount;
[object]$pendingCount;
[object]$lastUpdateDateTime;
[object]$successCount;

}

Class microsoft_graph_deviceConfigurationUserOverview_beta : microsoft_graph_entity_beta {
[object]$configurationVersion;
[object]$failedCount;
[object]$errorCount;
[object]$pendingCount;
[object]$lastUpdateDateTime;
[object]$successCount;

}

Class microsoft_graph_settingStateDeviceSummary_beta : microsoft_graph_entity_beta {
[object]$conflictDeviceCount;
[object]$notApplicableDeviceCount;
[object]$instancePath;
[object]$remediatedDeviceCount;
[object]$settingName;
[object]$compliantDeviceCount;
[object]$unknownDeviceCount;
[object]$nonCompliantDeviceCount;
[object]$errorDeviceCount;

}

Class microsoft_graph_deviceCompliancePolicyAssignment_beta : microsoft_graph_entity_beta {

[object]Get_deviceCompliancePolicy() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceCompliancePolicyAssignments/$($this.Id)/deviceCompliancePolicy")  }

}

Class microsoft_graph_deviceCompliancePolicyGroupAssignment_beta : microsoft_graph_deviceCompliancePolicyAssignment_beta {
[object]$targetGroupId;

}

Class microsoft_graph_deviceComplianceScheduledActionForRule_beta : microsoft_graph_entity_beta {
[object]$ruleName;

[object]Get_scheduledActionConfigurations() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceComplianceScheduledActionForRules/$($this.Id)/scheduledActionConfigurations")  }

}

Class microsoft_graph_deviceComplianceDeviceStatus_beta : microsoft_graph_entity_beta {
[object]$status;
[object]$deviceDisplayName;
[object]$userPrincipalName;
[object]$lastReportedDateTime;

}

Class microsoft_graph_deviceComplianceUserStatus_beta : microsoft_graph_entity_beta {
[object]$userDisplayName;
[object]$devicesCount;
[object]$status;
[object]$lastReportedDateTime;
[object]$userPrincipalName;

}

Class microsoft_graph_deviceComplianceDeviceOverview_beta : microsoft_graph_entity_beta {
[object]$configurationVersion;
[object]$failedCount;
[object]$errorCount;
[object]$pendingCount;
[object]$lastUpdateDateTime;
[object]$successCount;

}

Class microsoft_graph_deviceComplianceUserOverview_beta : microsoft_graph_entity_beta {
[object]$configurationVersion;
[object]$failedCount;
[object]$errorCount;
[object]$pendingCount;
[object]$lastUpdateDateTime;
[object]$successCount;

}

Class microsoft_graph_deviceComplianceActionItem_beta : microsoft_graph_entity_beta {
[object]$actionType;
[object]$notificationTemplateId;
[object]$gracePeriodHours;

[object]Get_notificationMessageTemplate() { return (Invoke-GraphMethod -Version 'beta' -Query "deviceComplianceActionItems/$($this.Id)/notificationMessageTemplate")  }

}

Class microsoft_graph_deviceComplianceSettingState_beta : microsoft_graph_entity_beta {
[object]$userName;
[object]$devicePlatform;
[object]$state;
[object]$settingName;
[object]$deviceName;
[object]$deviceId;

}

Class microsoft_graph_androidForWorkEasEmailProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$authenticationMethod;
[object]$hostName;
[object]$usernameSource;
[object]$requireSsl;
[object]$emailAddressSource;
[object]$durationOfEmailToSync;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidForWorkEasEmailProfileBases/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_androidForWorkCertificateProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$subjectAlternativeNameType;
[object]$certificateValidityPeriodScale;
[object]$certificateValidityPeriodValue;
[object]$subjectNameFormat;
[object]$renewalThresholdPercentage;
[object]$extendedKeyUsages;

[object]Get_rootCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidForWorkCertificateProfileBases/$($this.Id)/rootCertificate")  }

}

Class microsoft_graph_androidForWorkTrustedRootCertificate_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certFileName;
[object]$trustedRootCertificate;

}

Class microsoft_graph_androidForWorkPkcsCertificateProfile_beta : microsoft_graph_androidForWorkCertificateProfileBase_beta {
[object]$certificateTemplateName;
[object]$certificationAuthority;
[object]$certificationAuthorityName;

}

Class microsoft_graph_androidForWorkScepCertificateProfile_beta : microsoft_graph_androidForWorkCertificateProfileBase_beta {
[object]$keySize;
[object]$scepServerUrls;
[object]$keyUsage;
[object]$hashAlgorithm;

[object]Get_managedDeviceCertificateStates() { return (Invoke-GraphMethod -Version 'beta' -Query "androidForWorkScepCertificateProfiles/$($this.Id)/managedDeviceCertificateStates")  }

}

Class microsoft_graph_managedDeviceCertificateState_beta : microsoft_graph_entity_beta {
[object]$serverUrl;
[object]$userDisplayName;
[object]$certificateIssuer;
[object]$devicePlatform;
[object]$lastCertificateStateChangeDateTime;
[object]$certificateKeyUsage;
[object]$certificateProfileDisplayName;
[object]$enhancedKeyUsage;
[object]$certificateSerialNumber;
[object]$certificateKeyLength;
[object]$certificateThumbprint;
[object]$deviceDisplayName;
[object]$certificateExpirationDateTime;

}

Class microsoft_graph_androidForWorkGmailEasConfiguration_beta : microsoft_graph_androidForWorkEasEmailProfileBase_beta {

}

Class microsoft_graph_androidForWorkNineWorkEasConfiguration_beta : microsoft_graph_androidForWorkEasEmailProfileBase_beta {
[object]$syncCalendar;
[object]$syncContacts;
[object]$syncTasks;

}

Class microsoft_graph_androidCertificateProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$subjectAlternativeNameType;
[object]$certificateValidityPeriodScale;
[object]$certificateValidityPeriodValue;
[object]$subjectNameFormat;
[object]$renewalThresholdPercentage;
[object]$extendedKeyUsages;

[object]Get_rootCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidCertificateProfileBases/$($this.Id)/rootCertificate")  }

}

Class microsoft_graph_androidTrustedRootCertificate_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certFileName;
[object]$trustedRootCertificate;

}

Class microsoft_graph_androidPkcsCertificateProfile_beta : microsoft_graph_androidCertificateProfileBase_beta {
[object]$certificateTemplateName;
[object]$certificationAuthority;
[object]$certificationAuthorityName;

}

Class microsoft_graph_androidScepCertificateProfile_beta : microsoft_graph_androidCertificateProfileBase_beta {
[object]$keySize;
[object]$scepServerUrls;
[object]$keyUsage;
[object]$hashAlgorithm;

[object]Get_managedDeviceCertificateStates() { return (Invoke-GraphMethod -Version 'beta' -Query "androidScepCertificateProfiles/$($this.Id)/managedDeviceCertificateStates")  }

}

Class microsoft_graph_androidCustomConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$omaSettings;

}

Class microsoft_graph_androidEasEmailProfileConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$syncCalendar;
[object]$requireSsl;
[object]$emailSyncSchedule;
[object]$usernameSource;
[object]$authenticationMethod;
[object]$emailAddressSource;
[object]$syncTasks;
[object]$requireSmime;
[object]$hostName;
[object]$durationOfEmailToSync;
[object]$syncNotes;
[object]$syncContacts;
[object]$accountName;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidEasEmailProfileConfigurations/$($this.Id)/identityCertificate")  }

[object]Get_smimeSigningCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidEasEmailProfileConfigurations/$($this.Id)/smimeSigningCertificate")  }

}

Class microsoft_graph_androidForWorkCustomConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$omaSettings;

}

Class microsoft_graph_androidForWorkWiFiConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$connectAutomatically;
[object]$ssid;
[object]$networkName;
[object]$connectWhenNetworkNameIsHidden;
[object]$wiFiSecurityType;

}

Class microsoft_graph_androidForWorkEnterpriseWiFiConfiguration_beta : microsoft_graph_androidForWorkWiFiConfiguration_beta {
[object]$authenticationMethod;
[object]$nonEapAuthenticationMethodForEapTtls;
[object]$enableOuterIdentityPrivacy;
[object]$nonEapAuthenticationMethodForPeap;
[object]$eapType;

[object]Get_rootCertificateForServerValidation() { return (Invoke-GraphMethod -Version 'beta' -Query "androidForWorkEnterpriseWiFiConfigurations/$($this.Id)/rootCertificateForServerValidation")  }

[object]Get_identityCertificateForClientAuthentication() { return (Invoke-GraphMethod -Version 'beta' -Query "androidForWorkEnterpriseWiFiConfigurations/$($this.Id)/identityCertificateForClientAuthentication")  }

}

Class microsoft_graph_androidForWorkGeneralDeviceConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$workProfileDataSharingType;
[object]$passwordMinutesOfInactivityBeforeScreenTimeout;
[object]$passwordBlockTrustAgents;
[object]$passwordPreviousPasswordBlockCount;
[object]$workProfileDefaultAppPermissionPolicy;
[object]$passwordSignInFailureCountBeforeFactoryReset;
[object]$passwordExpirationDays;
[object]$passwordBlockFingerprintUnlock;
[object]$passwordRequiredType;
[object]$passwordMinimumLength;
[object]$workProfileBlockNotificationsWhileDeviceLocked;

}

Class microsoft_graph_androidForWorkVpnConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$authenticationMethod;
[object]$servers;
[object]$enableSplitTunneling;
[object]$connectionName;
[object]$role;
[object]$fingerprint;
[object]$customData;
[object]$connectionType;
[object]$realm;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidForWorkVpnConfigurations/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_androidGeneralDeviceConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$appsBlockCopyPaste;
[object]$googlePlayStoreBlocked;
[object]$cellularBlockWiFiTethering;
[object]$storageRequireDeviceEncryption;
[object]$nfcBlocked;
[object]$diagnosticDataBlockSubmission;
[object]$cellularBlockDataRoaming;
[object]$passwordBlockTrustAgents;
[object]$storageBlockGoogleBackup;
[object]$cameraBlocked;
[object]$deviceSharingAllowed;
[object]$compliantAppsList;
[object]$googleAccountBlockAutoSync;
[object]$voiceDialingBlocked;
[object]$compliantAppListType;
[object]$appsBlockClipboardSharing;
[object]$webBrowserBlockPopups;
[object]$voiceAssistantBlocked;
[object]$bluetoothBlocked;
[object]$cellularBlockMessaging;
[object]$webBrowserCookieSettings;
[object]$wiFiBlocked;
[object]$passwordExpirationDays;
[object]$storageBlockRemovableStorage;
[object]$powerOffBlocked;
[object]$kioskModeBlockSleepButton;
[object]$screenCaptureBlocked;
[object]$kioskModeManagedAppId;
[object]$passwordMinimumLength;
[object]$passwordRequired;
[object]$kioskModeBlockVolumeButtons;
[object]$passwordSignInFailureCountBeforeFactoryReset;
[object]$webBrowserBlocked;
[object]$webBrowserBlockJavaScript;
[object]$passwordMinutesOfInactivityBeforeScreenTimeout;
[object]$factoryResetBlocked;
[object]$locationServicesBlocked;
[object]$webBrowserBlockAutofill;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordRequiredType;
[object]$storageRequireRemovableStorageEncryption;
[object]$appsBlockYouTube;
[object]$passwordBlockFingerprintUnlock;
[object]$cellularBlockVoiceRoaming;

}

Class microsoft_graph_androidVpnConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$authenticationMethod;
[object]$servers;
[object]$connectionName;
[object]$role;
[object]$fingerprint;
[object]$customData;
[object]$connectionType;
[object]$realm;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "androidVpnConfigurations/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_androidWiFiConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$connectAutomatically;
[object]$ssid;
[object]$networkName;
[object]$connectWhenNetworkNameIsHidden;
[object]$wiFiSecurityType;

}

Class microsoft_graph_androidEnterpriseWiFiConfiguration_beta : microsoft_graph_androidWiFiConfiguration_beta {
[object]$authenticationMethod;
[object]$nonEapAuthenticationMethodForEapTtls;
[object]$enableOuterIdentityPrivacy;
[object]$nonEapAuthenticationMethodForPeap;
[object]$eapType;

[object]Get_rootCertificateForServerValidation() { return (Invoke-GraphMethod -Version 'beta' -Query "androidEnterpriseWiFiConfigurations/$($this.Id)/rootCertificateForServerValidation")  }

[object]Get_identityCertificateForClientAuthentication() { return (Invoke-GraphMethod -Version 'beta' -Query "androidEnterpriseWiFiConfigurations/$($this.Id)/identityCertificateForClientAuthentication")  }

}

Class microsoft_graph_iosCertificateProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certificateValidityPeriodValue;
[object]$subjectAlternativeNameType;
[object]$renewalThresholdPercentage;
[object]$certificateValidityPeriodScale;
[object]$subjectNameFormat;

}

Class microsoft_graph_iosPkcsCertificateProfile_beta : microsoft_graph_iosCertificateProfileBase_beta {
[object]$certificateTemplateName;
[object]$certificationAuthority;
[object]$certificationAuthorityName;

}

Class microsoft_graph_iosScepCertificateProfile_beta : microsoft_graph_iosCertificateProfileBase_beta {
[object]$keySize;
[object]$extendedKeyUsages;
[object]$scepServerUrls;
[object]$keyUsage;
[object]$subjectNameFormatString;

[object]Get_rootCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "iosScepCertificateProfiles/$($this.Id)/rootCertificate")  }

[object]Get_managedDeviceCertificateStates() { return (Invoke-GraphMethod -Version 'beta' -Query "iosScepCertificateProfiles/$($this.Id)/managedDeviceCertificateStates")  }

}

Class microsoft_graph_iosTrustedRootCertificate_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certFileName;
[object]$trustedRootCertificate;

}

Class microsoft_graph_iosCustomConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$payloadFileName;
[object]$payloadName;
[object]$payload;

}

Class microsoft_graph_iosEasEmailProfileConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$authenticationMethod;
[object]$hostName;
[object]$accountName;
[object]$blockSyncingRecentlyUsedEmailAddresses;
[object]$blockMovingMessagesToOtherEmailAccounts;
[object]$emailAddressSource;
[object]$usernameSource;
[object]$requireSmime;
[object]$blockSendingEmailFromThirdPartyApps;
[object]$requireSsl;
[object]$durationOfEmailToSync;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "iosEasEmailProfileConfigurations/$($this.Id)/identityCertificate")  }

[object]Get_smimeSigningCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "iosEasEmailProfileConfigurations/$($this.Id)/smimeSigningCertificate")  }

}

Class microsoft_graph_iosEduDeviceConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$deviceCertificateSettings;
[object]$teacherCertificateSettings;
[object]$studentCertificateSettings;

}

Class microsoft_graph_iosEducationDeviceConfiguration_beta : microsoft_graph_deviceConfiguration_beta {

}

Class microsoft_graph_iosGeneralDeviceConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$kioskModeAllowTouchscreen;
[object]$iCloudBlockActivityContinuation;
[object]$lockScreenBlockNotificationView;
[object]$configurationProfileBlockChanges;
[object]$kioskModeAllowVoiceOverSettings;
[object]$keyboardBlockPredictive;
[object]$accountBlockModification;
[object]$iTunesBlockRadio;
[object]$iTunesBlockExplicitContent;
[object]$notificationsBlockSettingsModification;
[object]$iTunesBlockMusicService;
[object]$screenCaptureBlocked;
[object]$appStoreBlockInAppPurchases;
[object]$kioskModeManagedAppId;
[object]$iCloudBlockPhotoLibrary;
[object]$safariBlockAutofill;
[object]$kioskModeRequireVoiceOver;
[object]$kioskModeAppStoreUrl;
[object]$mediaContentRatingAustralia;
[object]$appsVisibilityList;
[object]$kioskModeAllowRingerSwitch;
[object]$gameCenterBlocked;
[object]$deviceBlockEraseContentAndSettings;
[object]$gamingBlockMultiplayer;
[object]$siriRequireProfanityFilter;
[object]$cellularBlockPersonalHotspot;
[object]$lockScreenBlockPassbook;
[object]$deviceBlockEnableRestrictions;
[object]$appleWatchBlockPairing;
[object]$kioskModeAllowSleepButton;
[object]$passcodeMinimumLength;
[object]$safariBlocked;
[object]$mediaContentRatingApps;
[object]$appStoreRequirePassword;
[object]$passcodeBlockSimple;
[object]$siriBlockUserGeneratedContent;
[object]$iCloudBlockSharedPhotoStream;
[object]$compliantAppListType;
[object]$findMyFriendsBlocked;
[object]$kioskModeRequireZoom;
[object]$emailInDomainSuffixes;
[object]$voiceDialingBlocked;
[object]$classroomAppBlockRemoteScreenObservation;
[object]$iCloudBlockManagedAppsSync;
[object]$iCloudBlockBackup;
[object]$cellularBlockGlobalBackgroundFetchWhileRoaming;
[object]$siriBlockedWhenLocked;
[object]$iCloudBlockPhotoStreamSync;
[object]$diagnosticDataBlockSubmission;
[object]$lockScreenBlockControlCenter;
[object]$passcodeBlockFingerprintUnlock;
[object]$appStoreBlockUIAppInstallation;
[object]$iCloudBlockDocumentSync;
[object]$iBooksStoreBlocked;
[object]$diagnosticDataBlockSubmissionModification;
[object]$documentsBlockManagedDocumentsInUnmanagedApps;
[object]$safariManagedDomains;
[object]$siriBlocked;
[object]$passcodeSignInFailureCountBeforeWipe;
[object]$appleWatchForceWristDetection;
[object]$kioskModeAllowScreenRotation;
[object]$iBooksStoreBlockErotica;
[object]$safariPasswordAutoFillDomains;
[object]$kioskModeAllowAssistiveSpeak;
[object]$appleNewsBlocked;
[object]$documentsBlockUnmanagedDocumentsInManagedApps;
[object]$messagesBlocked;
[object]$compliantAppsList;
[object]$keyboardBlockShortcuts;
[object]$appsSingleAppModeList;
[object]$mediaContentRatingFrance;
[object]$safariBlockJavaScript;
[object]$deviceBlockNameModification;
[object]$airDropBlocked;
[object]$faceTimeBlocked;
[object]$mediaContentRatingIreland;
[object]$mediaContentRatingCanada;
[object]$passcodeMinutesOfInactivityBeforeLock;
[object]$hostPairingBlocked;
[object]$cellularBlockPerAppDataModification;
[object]$podcastsBlocked;
[object]$keyboardBlockSpellCheck;
[object]$mediaContentRatingUnitedStates;
[object]$passcodeExpirationDays;
[object]$appsVisibilityListType;
[object]$appStoreBlockAutomaticDownloads;
[object]$safariRequireFraudWarning;
[object]$passcodeMinutesOfInactivityBeforeScreenTimeout;
[object]$kioskModeAllowAutoLock;
[object]$airDropForceUnmanagedDropTarget;
[object]$kioskModeAllowColorInversionSettings;
[object]$kioskModeAllowVolumeButtons;
[object]$enterpriseAppBlockTrust;
[object]$activationLockAllowWhenSupervised;
[object]$mediaContentRatingUnitedKingdom;
[object]$appStoreBlocked;
[object]$iCloudRequireEncryptedBackup;
[object]$mediaContentRatingJapan;
[object]$kioskModeAllowAssistiveTouchSettings;
[object]$airPlayForcePairingPasswordForOutgoingRequests;
[object]$passcodeRequired;
[object]$kioskModeAllowZoomSettings;
[object]$kioskModeRequireAssistiveTouch;
[object]$cameraBlocked;
[object]$wallpaperBlockModification;
[object]$passcodeRequiredType;
[object]$mediaContentRatingGermany;
[object]$certificatesBlockUntrustedTlsCertificates;
[object]$passcodeBlockFingerprintModification;
[object]$gamingBlockGameCenterFriends;
[object]$passcodeBlockModification;
[object]$kioskModeRequireColorInversion;
[object]$kioskModeRequireMonoAudio;
[object]$lockScreenBlockTodayView;
[object]$safariBlockPopups;
[object]$cellularBlockVoiceRoaming;
[object]$cellularBlockDataRoaming;
[object]$keyboardBlockAutoCorrect;
[object]$bluetoothBlockModification;
[object]$safariCookieSettings;
[object]$passcodePreviousPasscodeBlockCount;
[object]$spotlightBlockInternetResults;
[object]$passcodeMinimumCharacterSetCount;
[object]$enterpriseAppBlockTrustModification;
[object]$mediaContentRatingNewZealand;
[object]$definitionLookupBlocked;

}

Class microsoft_graph_iosWiFiConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$proxyManualPort;
[object]$networkName;
[object]$wiFiSecurityType;
[object]$proxyAutomaticConfigurationUrl;
[object]$proxyManualAddress;
[object]$connectWhenNetworkNameIsHidden;
[object]$proxySettings;
[object]$ssid;
[object]$connectAutomatically;

}

Class microsoft_graph_iosEnterpriseWiFiConfiguration_beta : microsoft_graph_iosWiFiConfiguration_beta {
[object]$authenticationMethod;
[object]$eapFastConfiguration;
[object]$trustedServerCertificateNames;
[object]$nonEapAuthenticationMethodForEapTtls;
[object]$eapType;
[object]$enableOuterIdentityPrivacy;

[object]Get_rootCertificatesForServerValidation() { return (Invoke-GraphMethod -Version 'beta' -Query "iosEnterpriseWiFiConfigurations/$($this.Id)/rootCertificatesForServerValidation")  }

[object]Get_identityCertificateForClientAuthentication() { return (Invoke-GraphMethod -Version 'beta' -Query "iosEnterpriseWiFiConfigurations/$($this.Id)/identityCertificateForClientAuthentication")  }

}

Class microsoft_graph_macOSCertificateProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certificateValidityPeriodValue;
[object]$subjectAlternativeNameType;
[object]$renewalThresholdPercentage;
[object]$certificateValidityPeriodScale;
[object]$subjectNameFormat;

}

Class microsoft_graph_macOSScepCertificateProfile_beta : microsoft_graph_macOSCertificateProfileBase_beta {
[object]$subjectNameFormatString;
[object]$scepServerUrls;
[object]$hashAlgorithm;
[object]$keyUsage;
[object]$extendedKeyUsages;
[object]$keySize;

[object]Get_rootCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "macOSScepCertificateProfiles/$($this.Id)/rootCertificate")  }

[object]Get_managedDeviceCertificateStates() { return (Invoke-GraphMethod -Version 'beta' -Query "macOSScepCertificateProfiles/$($this.Id)/managedDeviceCertificateStates")  }

}

Class microsoft_graph_macOSTrustedRootCertificate_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certFileName;
[object]$trustedRootCertificate;

}

Class microsoft_graph_macOSCustomConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$payloadFileName;
[object]$payloadName;
[object]$payload;

}

Class microsoft_graph_macOSGeneralDeviceConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$passwordRequired;
[object]$passwordMinutesOfInactivityBeforeScreenTimeout;
[object]$compliantAppsList;
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordMinimumCharacterSetCount;
[object]$passwordBlockSimple;
[object]$compliantAppListType;
[object]$passwordExpirationDays;
[object]$passwordRequiredType;
[object]$emailInDomainSuffixes;
[object]$passwordMinimumLength;

}

Class microsoft_graph_macOSWiFiConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$proxyManualPort;
[object]$networkName;
[object]$wiFiSecurityType;
[object]$proxyAutomaticConfigurationUrl;
[object]$proxyManualAddress;
[object]$connectWhenNetworkNameIsHidden;
[object]$proxySettings;
[object]$ssid;
[object]$connectAutomatically;

}

Class microsoft_graph_macOSEnterpriseWiFiConfiguration_beta : microsoft_graph_macOSWiFiConfiguration_beta {
[object]$authenticationMethod;
[object]$eapFastConfiguration;
[object]$trustedServerCertificateNames;
[object]$nonEapAuthenticationMethodForEapTtls;
[object]$eapType;
[object]$enableOuterIdentityPrivacy;

[object]Get_rootCertificateForServerValidation() { return (Invoke-GraphMethod -Version 'beta' -Query "macOSEnterpriseWiFiConfigurations/$($this.Id)/rootCertificateForServerValidation")  }

[object]Get_identityCertificateForClientAuthentication() { return (Invoke-GraphMethod -Version 'beta' -Query "macOSEnterpriseWiFiConfigurations/$($this.Id)/identityCertificateForClientAuthentication")  }

}

Class microsoft_graph_appleDeviceFeaturesConfigurationBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$airPrintDestinations;

}

Class microsoft_graph_iosDeviceFeaturesConfiguration_beta : microsoft_graph_appleDeviceFeaturesConfigurationBase_beta {
[object]$lockScreenFootnote;
[object]$homeScreenPages;
[object]$notificationSettings;
[object]$contentFilterSettings;
[object]$assetTagTemplate;
[object]$homeScreenDockIcons;

}

Class microsoft_graph_macOSDeviceFeaturesConfiguration_beta : microsoft_graph_appleDeviceFeaturesConfigurationBase_beta {

}

Class microsoft_graph_appleVpnConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$onDemandRules;
[object]$server;
[object]$connectionName;
[object]$connectionType;
[object]$authenticationMethod;
[object]$enablePerApp;
[object]$loginGroupOrDomain;
[object]$realm;
[object]$identifier;
[object]$customData;
[object]$enableSplitTunneling;
[object]$proxyServer;
[object]$role;
[object]$safariDomains;

}

Class microsoft_graph_iosVpnConfiguration_beta : microsoft_graph_appleVpnConfiguration_beta {

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "iosVpnConfigurations/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_macOSVpnConfiguration_beta : microsoft_graph_appleVpnConfiguration_beta {

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "macOSVpnConfigurations/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_windows10CustomConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$omaSettings;

}

Class microsoft_graph_windows10EasEmailProfileConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$requireSsl;
[object]$accountName;
[object]$hostName;
[object]$emailAddressSource;
[object]$syncContacts;
[object]$usernameSource;
[object]$emailSyncSchedule;
[object]$durationOfEmailToSync;
[object]$syncTasks;
[object]$syncCalendar;

}

Class microsoft_graph_windows10GeneralConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$experienceBlockDeviceDiscovery;
[object]$edgeCookiePolicy;
[object]$experienceBlockErrorDialogWhenNoSIM;
[object]$cortanaBlocked;
[object]$startMenuPinnedFolderMusic;
[object]$defenderScanNetworkFiles;
[object]$passwordRequired;
[object]$startMenuPinnedFolderVideos;
[object]$startMenuPinnedFolderPersonalFolder;
[object]$settingsBlockChangeSystemTime;
[object]$lockScreenBlockActionCenterNotifications;
[object]$startMenuHideRecentJumpLists;
[object]$settingsBlockSystemPage;
[object]$deviceManagementBlockManualUnenroll;
[object]$passwordPreviousPasswordBlockCount;
[object]$defenderSystemScanSchedule;
[object]$usbBlocked;
[object]$defenderScanDownloads;
[object]$windowsStoreEnablePrivateStoreOnly;
[object]$wirelessDisplayBlockUserInputFromReceiver;
[object]$cellularBlockDataWhenRoaming;
[object]$startMenuMode;
[object]$startMenuHidePowerButton;
[object]$settingsBlockEditDeviceName;
[object]$defenderMonitorFileActivity;
[object]$settingsBlockPersonalizationPage;
[object]$appsBlockWindowsStoreOriginatedApps;
[object]$settingsBlockDevicesPage;
[object]$settingsBlockUpdateSecurityPage;
[object]$settingsBlockPrivacyPage;
[object]$wiFiBlockAutomaticConnectHotspots;
[object]$settingsBlockSettingsApp;
[object]$edgeFirstRunUrl;
[object]$defenderProcessesToExclude;
[object]$edgeEnterpriseModeSiteListLocation;
[object]$defenderScheduledScanTime;
[object]$passwordMinimumCharacterSetCount;
[object]$storageRestrictAppDataToSystemVolume;
[object]$experienceBlockTaskSwitcher;
[object]$gameDvrBlocked;
[object]$startBlockUnpinningAppsFromTaskbar;
[object]$startMenuHideUserTile;
[object]$cellularBlockVpnWhenRoaming;
[object]$passwordSignInFailureCountBeforeFactoryReset;
[object]$accountsBlockAddingNonMicrosoftAccountEmail;
[object]$defenderScanMaxCpu;
[object]$locationServicesBlocked;
[object]$startMenuPinnedFolderFileExplorer;
[object]$edgeBlockSendingDoNotTrackHeader;
[object]$passwordExpirationDays;
[object]$edgeHomepageUrls;
[object]$startMenuPinnedFolderPictures;
[object]$passwordRequireWhenResumeFromIdleState;
[object]$windowsStoreBlocked;
[object]$wiFiBlocked;
[object]$certificatesBlockManualRootCertificateInstallation;
[object]$startMenuPinnedFolderDocuments;
[object]$startMenuLayoutEdgeAssetsXml;
[object]$defenderPromptForSampleSubmission;
[object]$edgeBlockAccessToAboutFlags;
[object]$storageBlockRemovableStorage;
[object]$webRtcBlockLocalhostIpAddress;
[object]$startMenuHideRestartOptions;
[object]$safeSearchFilter;
[object]$automaticUpdateSchedule;
[object]$settingsBlockRemoveProvisioningPackage;
[object]$startMenuPinnedFolderDownloads;
[object]$networkProxyServer;
[object]$startMenuPinnedFolderSettings;
[object]$screenCaptureBlocked;
[object]$passwordMinimumLength;
[object]$windowsStoreBlockAutoUpdate;
[object]$nfcBlocked;
[object]$defenderScanScriptsLoadedInInternetExplorer;
[object]$passwordMinutesOfInactivityBeforeScreenTimeout;
[object]$defenderScanRemovableDrivesDuringFullScan;
[object]$microsoftAccountBlocked;
[object]$diagnosticsDataSubmissionMode;
[object]$settingsBlockChangePowerSleep;
[object]$sharedUserAppDataAllowed;
[object]$edgeBlocked;
[object]$copyPasteBlocked;
[object]$voiceRecordingBlocked;
[object]$defenderSignatureUpdateIntervalInHours;
[object]$edgeBlockInPrivateBrowsing;
[object]$settingsBlockTimeLanguagePage;
[object]$bluetoothBlockDiscoverableMode;
[object]$defenderFileExtensionsToExclude;
[object]$wiFiBlockManualConfiguration;
[object]$antiTheftModeBlocked;
[object]$settingsBlockChangeLanguage;
[object]$developerUnlockSetting;
[object]$defenderBlockEndUserAccess;
[object]$defenderRequireNetworkInspectionSystem;
[object]$startMenuPinnedFolderHomeGroup;
[object]$automaticUpdateTime;
[object]$defenderRequireCloudProtection;
[object]$defenderFilesAndFoldersToExclude;
[object]$resetProtectionModeBlocked;
[object]$networkProxyApplySettingsDeviceWide;
[object]$defenderScanArchiveFiles;
[object]$experienceBlockConsumerSpecificFeatures;
[object]$defenderScanIncomingMail;
[object]$startMenuAppListVisibility;
[object]$deviceManagementBlockFactoryResetOnMobile;
[object]$edgeBlockJavaScript;
[object]$edgeRequireSmartScreen;
[object]$settingsBlockAddProvisioningPackage;
[object]$edgeBlockAutofill;
[object]$settingsBlockNetworkInternetPage;
[object]$defenderScheduledQuickScanTime;
[object]$oneDriveDisableFileSync;
[object]$startMenuLayoutXml;
[object]$wirelessDisplayBlockProjectionToThisDevice;
[object]$appsAllowTrustedAppsSideloading;
[object]$bluetoothBlocked;
[object]$experienceBlockWindowsSpotlight;
[object]$defenderRequireRealTimeMonitoring;
[object]$wiFiScanInterval;
[object]$automaticUpdateMode;
[object]$cameraBlocked;
[object]$networkProxyDisableAutoDetect;
[object]$logonBlockFastUserSwitching;
[object]$cellularBlockVpn;
[object]$defenderScanType;
[object]$edgeBlockSendingIntranetTrafficToInternetExplorer;
[object]$smartScreenBlockPromptOverride;
[object]$defenderScanMappedNetworkDrivesDuringFullScan;
[object]$settingsBlockAccountsPage;
[object]$storageRestrictAppInstallToSystemVolume;
[object]$startMenuPinnedFolderNetwork;
[object]$defenderDaysBeforeDeletingQuarantinedMalware;
[object]$bluetoothBlockAdvertising;
[object]$settingsBlockChangeRegion;
[object]$edgeBlockSearchSuggestions;
[object]$defenderRequireBehaviorMonitoring;
[object]$microsoftAccountBlockSettingsSync;
[object]$startMenuHideRecentlyAddedApps;
[object]$edgeBlockPasswordManager;
[object]$experienceBlockWindowsTips;
[object]$personalizationDesktopImageUrl;
[object]$personalizationLockScreenImageUrl;
[object]$bluetoothDeviceName;
[object]$networkProxyAutomaticConfigurationUrl;
[object]$wirelessDisplayRequirePinForPairing;
[object]$internetSharingBlocked;
[object]$edgeBlockPopups;
[object]$smartScreenBlockPromptOverrideForFiles;
[object]$startMenuHideFrequentlyUsedApps;
[object]$edgeBlockDeveloperTools;
[object]$edgeBlockExtensions;
[object]$storageRequireMobileDeviceEncryption;
[object]$prereleaseFeatures;
[object]$settingsBlockEaseOfAccessPage;
[object]$edgeSearchEngine;
[object]$passwordRequiredType;

}

Class microsoft_graph_windows10EnterpriseModernAppManagementConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$uninstallBuiltInApps;

}

Class microsoft_graph_sharedPCConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$disableAccountManager;
[object]$enabled;
[object]$allowedAccounts;
[object]$disablePowerPolicies;
[object]$kioskAppDisplayName;
[object]$maintenanceStartTime;
[object]$disableEduPolicies;
[object]$idleTimeBeforeSleepInSeconds;
[object]$disableSignInOnResume;
[object]$kioskAppUserModelId;
[object]$allowLocalStorage;
[object]$accountManagerPolicy;

}

Class microsoft_graph_windows10SecureAssessmentConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$allowScreenCapture;
[object]$allowTextSuggestion;
[object]$configurationAccount;
[object]$launchUri;
[object]$allowPrinting;

}

Class microsoft_graph_windows81WifiImportConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$payloadFileName;
[object]$profileName;
[object]$payload;

}

Class microsoft_graph_windowsCertificateProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$subjectAlternativeNameType;
[object]$certificateValidityPeriodScale;
[object]$keyStorageProvider;
[object]$subjectNameFormat;
[object]$certificateValidityPeriodValue;
[object]$renewalThresholdPercentage;

}

Class microsoft_graph_windows10CertificateProfileBase_beta : microsoft_graph_windowsCertificateProfileBase_beta {

}

Class microsoft_graph_windows10PkcsCertificateProfile_beta : microsoft_graph_windows10CertificateProfileBase_beta {
[object]$certificateTemplateName;
[object]$certificationAuthority;
[object]$certificationAuthorityName;

}

Class microsoft_graph_windows81CertificateProfileBase_beta : microsoft_graph_windowsCertificateProfileBase_beta {
[object]$extendedKeyUsages;

}

Class microsoft_graph_windows81SCEPCertificateProfile_beta : microsoft_graph_windows81CertificateProfileBase_beta {
[object]$keySize;
[object]$scepServerUrls;
[object]$keyUsage;
[object]$hashAlgorithm;

[object]Get_rootCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "windows81SCEPCertificateProfiles/$($this.Id)/rootCertificate")  }

[object]Get_managedDeviceCertificateStates() { return (Invoke-GraphMethod -Version 'beta' -Query "windows81SCEPCertificateProfiles/$($this.Id)/managedDeviceCertificateStates")  }

}

Class microsoft_graph_windows81TrustedRootCertificate_beta : microsoft_graph_deviceConfiguration_beta {
[object]$destinationStore;
[object]$trustedRootCertificate;
[object]$certFileName;

}

Class microsoft_graph_windowsPhone81CustomConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$omaSettings;

}

Class microsoft_graph_windowsPhone81TrustedRootCertificate_beta : microsoft_graph_deviceConfiguration_beta {
[object]$certFileName;
[object]$trustedRootCertificate;

}

Class microsoft_graph_windowsPhoneEASEmailProfileConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$requireSsl;
[object]$applyOnlyToWindowsPhone81;
[object]$accountName;
[object]$hostName;
[object]$emailAddressSource;
[object]$syncContacts;
[object]$usernameSource;
[object]$emailSyncSchedule;
[object]$durationOfEmailToSync;
[object]$syncTasks;
[object]$syncCalendar;

}

Class microsoft_graph_windowsUpdateForBusinessConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$installationSchedule;
[object]$prereleaseFeatures;
[object]$qualityUpdatesPaused;
[object]$previewBuildSetting;
[object]$featureUpdatesPaused;
[object]$automaticUpdateMode;
[object]$featureUpdatesDeferralPeriodInDays;
[object]$qualityUpdatesDeferralPeriodInDays;
[object]$businessReadyUpdatesOnly;
[object]$restartMode;
[object]$microsoftUpdateServiceAllowed;
[object]$deliveryOptimizationMode;
[object]$qualityUpdatesPauseExpiryDateTime;
[object]$driversExcluded;
[object]$featureUpdatesPauseExpiryDateTime;

}

Class microsoft_graph_windowsVpnConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$connectionName;
[object]$servers;
[object]$customXml;

}

Class microsoft_graph_windows10VpnConfiguration_beta : microsoft_graph_windowsVpnConfiguration_beta {
[object]$dnsRules;
[object]$enableConditionalAccess;
[object]$windowsInformationProtectionDomain;
[object]$trafficRules;
[object]$connectionType;
[object]$authenticationMethod;
[object]$onlyAssociatedAppsCanUseConnection;
[object]$enableSingleSignOnWithAlternateCertificate;
[object]$routes;
[object]$rememberUserCredentials;
[object]$singleSignOnIssuerHash;
[object]$singleSignOnEku;
[object]$proxyServer;
[object]$eapXml;
[object]$associatedApps;
[object]$enableSplitTunneling;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "windows10VpnConfigurations/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_windows81VpnConfiguration_beta : microsoft_graph_windowsVpnConfiguration_beta {
[object]$enableSplitTunneling;
[object]$connectionType;
[object]$applyOnlyToWindows81;
[object]$loginGroupOrDomain;
[object]$proxyServer;

}

Class microsoft_graph_windowsPhone81VpnConfiguration_beta : microsoft_graph_windows81VpnConfiguration_beta {
[object]$authenticationMethod;
[object]$bypassVpnOnHomeWifi;
[object]$dnsSuffixSearchList;
[object]$bypassVpnOnCompanyWifi;
[object]$rememberUserCredentials;

[object]Get_identityCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "windowsPhone81VpnConfigurations/$($this.Id)/identityCertificate")  }

}

Class microsoft_graph_windowsPhone81CertificateProfileBase_beta : microsoft_graph_deviceConfiguration_beta {
[object]$subjectAlternativeNameType;
[object]$certificateValidityPeriodScale;
[object]$keyStorageProvider;
[object]$subjectNameFormat;
[object]$certificateValidityPeriodValue;
[object]$renewalThresholdPercentage;
[object]$extendedKeyUsages;

}

Class microsoft_graph_windowsPhone81SCEPCertificateProfile_beta : microsoft_graph_windowsPhone81CertificateProfileBase_beta {
[object]$keySize;
[object]$scepServerUrls;
[object]$keyUsage;
[object]$hashAlgorithm;

[object]Get_rootCertificate() { return (Invoke-GraphMethod -Version 'beta' -Query "windowsPhone81SCEPCertificateProfiles/$($this.Id)/rootCertificate")  }

[object]Get_managedDeviceCertificateStates() { return (Invoke-GraphMethod -Version 'beta' -Query "windowsPhone81SCEPCertificateProfiles/$($this.Id)/managedDeviceCertificateStates")  }

}

Class microsoft_graph_windows81GeneralConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$browserBlockSendingDoNotTrackHeader;
[object]$browserIntranetSecurityLevel;
[object]$storageRequireDeviceEncryption;
[object]$accountsBlockAddingNonMicrosoftAccountEmail;
[object]$browserBlockPlugins;
[object]$browserTrustedSitesSecurityLevel;
[object]$workFoldersUrl;
[object]$browserRequireFraudWarning;
[object]$cellularBlockDataRoaming;
[object]$browserInternetSecurityLevel;
[object]$minimumAutoInstallClassification;
[object]$browserBlockAutofill;
[object]$browserRequireFirewall;
[object]$browserBlockPopups;
[object]$diagnosticsBlockDataSubmission;
[object]$browserBlockJavaScript;
[object]$browserLoggingReportLocation;
[object]$passwordExpirationDays;
[object]$browserRequireSmartScreen;
[object]$browserBlockEnterpriseModeAccess;
[object]$browserRequireHighSecurityForRestrictedSites;
[object]$passwordMinimumLength;
[object]$browserBlockAutomaticDetectionOfIntranetSites;
[object]$passwordSignInFailureCountBeforeFactoryReset;
[object]$passwordBlockPicturePasswordAndPin;
[object]$passwordMinutesOfInactivityBeforeScreenTimeout;
[object]$applyOnlyToWindows81;
[object]$updatesRequireAutomaticUpdates;
[object]$userAccountControlSettings;
[object]$browserEnterpriseModeSiteListLocation;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordRequiredType;
[object]$browserBlockSingleWordEntryOnIntranetSites;
[object]$passwordMinimumCharacterSetCount;

}

Class microsoft_graph_windowsPhone81GeneralConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$appsBlockCopyPaste;
[object]$cellularBlockWifiTethering;
[object]$windowsStoreBlocked;
[object]$storageRequireEncryption;
[object]$nfcBlocked;
[object]$diagnosticDataBlockSubmission;
[object]$emailBlockAddingAccounts;
[object]$cameraBlocked;
[object]$compliantAppsList;
[object]$microsoftAccountBlocked;
[object]$compliantAppListType;
[object]$webBrowserBlocked;
[object]$bluetoothBlocked;
[object]$passwordBlockSimple;
[object]$passwordExpirationDays;
[object]$wifiBlockHotspotReporting;
[object]$storageBlockRemovableStorage;
[object]$wifiBlockAutomaticConnectHotspots;
[object]$screenCaptureBlocked;
[object]$passwordRequired;
[object]$passwordMinimumLength;
[object]$passwordSignInFailureCountBeforeFactoryReset;
[object]$wifiBlocked;
[object]$passwordMinutesOfInactivityBeforeScreenTimeout;
[object]$locationServicesBlocked;
[object]$passwordPreviousPasswordBlockCount;
[object]$applyOnlyToWindowsPhone81;
[object]$passwordRequiredType;
[object]$passwordMinimumCharacterSetCount;

}

Class microsoft_graph_windows10TeamGeneralConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$welcomeScreenMeetingInformation;
[object]$maintenanceWindowDurationInHours;
[object]$miracastChannel;
[object]$maintenanceWindowStartTime;
[object]$azureOperationalInsightsWorkspaceId;
[object]$maintenanceWindowBlocked;
[object]$azureOperationalInsightsWorkspaceKey;
[object]$miracastRequirePin;
[object]$azureOperationalInsightsBlockTelemetry;
[object]$miracastBlocked;
[object]$welcomeScreenBackgroundImageUrl;
[object]$welcomeScreenBlockAutomaticWakeUp;

}

Class microsoft_graph_editionUpgradeConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$license;
[object]$productKey;
[object]$targetEdition;
[object]$licenseType;

}

Class microsoft_graph_windowsDefenderAdvancedThreatProtectionConfiguration_beta : microsoft_graph_deviceConfiguration_beta {
[object]$advancedThreatProtectionOffboardingBlob;
[object]$advancedThreatProtectionOnboardingBlob;
[object]$allowSampleSharing;

}

Class microsoft_graph_localizedNotificationMessage_beta : microsoft_graph_entity_beta {
[object]$subject;
[object]$lastModifiedDateTime;
[object]$isDefault;
[object]$messageTemplate;
[object]$locale;

}

Class microsoft_graph_androidForWorkCompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$minAndroidSecurityPatchLevel;
[object]$osMaximumVersion;
[object]$passwordRequired;
[object]$storageRequireEncryption;
[object]$securityDisableUsbDebugging;
[object]$deviceThreatProtectionRequiredSecurityLevel;
[object]$osMinimumVersion;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordRequiredType;
[object]$securityBlockJailbrokenDevices;
[object]$securityPreventInstallAppsFromUnknownSources;
[object]$passwordExpirationDays;
[object]$passwordMinimumLength;
[object]$deviceThreatProtectionEnabled;

}

Class microsoft_graph_androidCompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$deviceThreatProtectionEnabled;
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$minAndroidSecurityPatchLevel;
[object]$osMaximumVersion;
[object]$passwordRequired;
[object]$storageRequireEncryption;
[object]$securityDisableUsbDebugging;
[object]$deviceThreatProtectionRequiredSecurityLevel;
[object]$osMinimumVersion;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordRequiredType;
[object]$securityBlockJailbrokenDevices;
[object]$securityPreventInstallAppsFromUnknownSources;
[object]$passwordExpirationDays;
[object]$passwordMinimumLength;
[object]$requireAppVerify;

}

Class microsoft_graph_iosCompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passcodeBlockSimple;
[object]$passcodeMinutesOfInactivityBeforeLock;
[object]$passcodeMinimumCharacterSetCount;
[object]$deviceThreatProtectionRequiredSecurityLevel;
[object]$passcodeExpirationDays;
[object]$osMaximumVersion;
[object]$osMinimumVersion;
[object]$passcodeRequired;
[object]$passcodePreviousPasscodeBlockCount;
[object]$securityBlockJailbrokenDevices;
[object]$passcodeRequiredType;
[object]$passcodeMinimumLength;
[object]$deviceThreatProtectionEnabled;
[object]$managedEmailProfileRequired;

}

Class microsoft_graph_macOSCompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$storageRequireEncryption;
[object]$passwordRequired;
[object]$passwordMinimumCharacterSetCount;
[object]$osMaximumVersion;
[object]$osMinimumVersion;
[object]$passwordRequiredType;
[object]$deviceThreatProtectionRequiredSecurityLevel;
[object]$passwordBlockSimple;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordExpirationDays;
[object]$passwordMinimumLength;
[object]$deviceThreatProtectionEnabled;

}

Class microsoft_graph_windows10CompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$passwordMinimumLength;
[object]$earlyLaunchAntiMalwareDriverEnabled;
[object]$passwordRequired;
[object]$passwordMinimumCharacterSetCount;
[object]$osMaximumVersion;
[object]$osMinimumVersion;
[object]$codeIntegrityEnabled;
[object]$passwordRequiredType;
[object]$passwordRequiredToUnlockFromIdle;
[object]$mobileOsMinimumVersion;
[object]$bitLockerEnabled;
[object]$passwordBlockSimple;
[object]$passwordPreviousPasswordBlockCount;
[object]$secureBootEnabled;
[object]$mobileOsMaximumVersion;
[object]$passwordExpirationDays;
[object]$requireHealthyDeviceReport;
[object]$storageRequireEncryption;

}

Class microsoft_graph_windows10MobileCompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$passwordRequired;
[object]$earlyLaunchAntiMalwareDriverEnabled;
[object]$passwordRequireToUnlockFromIdle;
[object]$passwordMinimumCharacterSetCount;
[object]$osMaximumVersion;
[object]$osMinimumVersion;
[object]$codeIntegrityEnabled;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordRequiredType;
[object]$bitLockerEnabled;
[object]$passwordBlockSimple;
[object]$secureBootEnabled;
[object]$passwordExpirationDays;
[object]$passwordMinimumLength;
[object]$storageRequireEncryption;

}

Class microsoft_graph_windows81CompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passwordRequired;
[object]$osMinimumVersion;
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordMinimumCharacterSetCount;
[object]$storageRequireEncryption;
[object]$passwordBlockSimple;
[object]$passwordExpirationDays;
[object]$passwordRequiredType;
[object]$osMaximumVersion;
[object]$passwordMinimumLength;

}

Class microsoft_graph_windowsPhone81CompliancePolicy_beta : microsoft_graph_deviceCompliancePolicy_beta {
[object]$passwordRequired;
[object]$osMinimumVersion;
[object]$passwordMinutesOfInactivityBeforeLock;
[object]$passwordPreviousPasswordBlockCount;
[object]$passwordMinimumCharacterSetCount;
[object]$storageRequireEncryption;
[object]$passwordBlockSimple;
[object]$passwordExpirationDays;
[object]$passwordRequiredType;
[object]$osMaximumVersion;
[object]$passwordMinimumLength;

}

Class microsoft_graph_onPremisesConditionalAccessSettings_beta : microsoft_graph_entity_beta {
[object]$includedGroups;
[object]$excludedGroups;
[object]$enabled;

}

Class microsoft_graph_mobileAppIdentifierDeployment_beta : microsoft_graph_entity_beta {
[object]$version;
[object]$mobileAppIdentifier;

}

Class microsoft_graph_managedAppPolicyDeploymentSummary_beta : microsoft_graph_entity_beta {
[object]$configurationDeploymentSummaryPerApp;
[object]$configurationDeployedUserCount;
[object]$displayName;
[object]$version;
[object]$lastRefreshTime;

}

Class microsoft_graph_managedAppOperation_beta : microsoft_graph_entity_beta {
[object]$lastModifiedDateTime;
[object]$displayName;
[object]$version;
[object]$state;

}

Class microsoft_graph_windowsInformationProtectionAppLockerFile_beta : microsoft_graph_entity_beta {
[object]$fileHash;
[object]$displayName;
[object]$file;
[object]$version;

}

Class microsoft_graph_iosManagedAppRegistration_beta : microsoft_graph_managedAppRegistration_beta {

}

Class microsoft_graph_androidManagedAppRegistration_beta : microsoft_graph_managedAppRegistration_beta {

}

Class microsoft_graph_managedAppStatusRaw_beta : microsoft_graph_managedAppStatus_beta {
[object]$content;

}

Class microsoft_graph_eBookGroupAssignment_beta : microsoft_graph_entity_beta {
[object]$targetGroupId;
[object]$installIntent;

}

Class microsoft_graph_deviceInstallState_beta : microsoft_graph_entity_beta {
[object]$lastSyncDateTime;
[object]$userName;
[object]$deviceName;
[object]$osVersion;
[object]$errorCode;
[object]$osDescription;
[object]$deviceId;
[object]$installState;

}

Class microsoft_graph_userInstallStateSummary_beta : microsoft_graph_entity_beta {
[object]$userName;
[object]$failedDeviceCount;
[object]$notInstalledDeviceCount;
[object]$installedDeviceCount;

[object]Get_deviceStates() { return (Invoke-GraphMethod -Version 'beta' -Query "userInstallStateSummarys/$($this.Id)/deviceStates")  }

}

Class microsoft_graph_iosVppEBook_beta : microsoft_graph_managedEBook_beta {
[object]$vppOrganizationName;
[object]$seller;
[object]$language;
[object]$appleId;
[object]$genres;
[object]$usedLicenseCount;
[object]$vppTokenId;
[object]$totalLicenseCount;

}

Class microsoft_graph_payloadResponse_beta : microsoft_graph_entity_beta {

}

Class microsoft_graph_chatThread_beta : microsoft_graph_entity_beta {

[object]Get_chatMessages() { return (Invoke-GraphMethod -Version 'beta' -Query "chatThreads/$($this.Id)/chatMessages")  }

[object]Get_rootMessage() { return (Invoke-GraphMethod -Version 'beta' -Query "chatThreads/$($this.Id)/rootMessage")  }

}

Class microsoft_graph_chatMessage_beta : microsoft_graph_entity_beta {
[object]$body;

[object]Get_inReplyTo() { return (Invoke-GraphMethod -Version 'beta' -Query "chatMessages/$($this.Id)/inReplyTo")  }

[object]Get_replies() { return (Invoke-GraphMethod -Version 'beta' -Query "chatMessages/$($this.Id)/replies")  }

[object]Get_from() { return (Invoke-GraphMethod -Version 'beta' -Query "chatMessages/$($this.Id)/from")  }

}

