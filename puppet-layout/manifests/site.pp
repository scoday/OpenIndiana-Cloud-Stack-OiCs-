#
#

#import "definitions/*.pp"
import "templates.pp"
import "nodes.pp"
#import "/data/puppet/manifests/sudo/*.pp"

import "/data/puppet/manifests/classes/system-config/sudo/*.pp"
import "/data/puppet/manifests/classes/system-config/users/*.pp"

#import "classes/group01/*.pp"
#import "classes/group02/*.pp"
#import "classes/services-group01/*.pp"
#import "classes/services-group02/*.pp"
#import "os/*.pp"

