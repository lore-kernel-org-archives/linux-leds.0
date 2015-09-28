From: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 3/3] Documentation: leds: document ledtrig-device trigger
Date: Mon, 28 Sep 2015 22:43:05 +0200
Message-ID: <0253c438453b6d244acede5a151856ef9c0cb850.1443472356.git.maciek.borzecki@gmail.com>
References: <cover.1443471365.git.maciek.borzecki@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <cover.1443471365.git.maciek.borzecki@gmail.com>
In-Reply-To: <cover.1443472356.git.maciek.borzecki@gmail.com>
References: <cover.1443472356.git.maciek.borzecki@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
List-Id: linux-leds@vger.kernel.org

This patch adds documentation for ledtrig-device trigger.

Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
---
 Documentation/leds/00-INDEX           |  3 +++
 Documentation/leds/ledtrig-device.txt | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/leds/ledtrig-device.txt

diff --git a/Documentation/leds/00-INDEX b/Documentation/leds/00-INDEX
index b4ef1f34e25faafe544971f619019d748538e4de..7f18adaadc04756a6b52157a71f86bd131dd915c 100644
--- a/Documentation/leds/00-INDEX
+++ b/Documentation/leds/00-INDEX
@@ -20,3 +20,6 @@ ledtrig-oneshot.txt
 	- One-shot LED trigger for both sporadic and dense events.
 ledtrig-transient.txt
 	- LED Transient Trigger, one shot timer activation.
+ledtrig-device.txt
+        - LED Device Activity Trigger for indicating an activity
+          on a device
\ No newline at end of file
diff --git a/Documentation/leds/ledtrig-device.txt b/Documentation/leds/ledtrig-device.txt
new file mode 100644
index 0000000000000000000000000000000000000000..b319d5da9df513a15b5c8094c6a5923682ff4579
--- /dev/null
+++ b/Documentation/leds/ledtrig-device.txt
@@ -0,0 +1,32 @@
+Device Activity LED Trigger
+==========================
+
+This is a LED trigger useful for signaling an activity on a given
+device identified by it's MKDEV(major, minor). A typical use case
+would be debugging of a device or a driver on an embedded board,
+patching up trivial electronic hardware design deficiencies in
+software or just plain desire to indicate activity on a certain
+device.
+
+Internally, a instance of a trigger is created and registered with LED
+triggers for every device added via ledtrig_dev_add() call. The
+triggers are named in the following manner:
+
+         `dev-<major>:<minor>`
+
+And can be selected from under /sys/class/leds/*/trigger. A device
+activity is explicitly indicated by calling ledtrig_dev_activity() for
+a registered device.
+
+The driver also creates a set of debugfs entries under
+/sys/kernel/debug/ledtrig-dev, these are:
+
+  devices - cat'ing will produce a list of currently registered
+            devices
+
+  register - echo'ing <major>:<minor> will create a trigger for this
+             device (note, you still need to add at least
+             ledtrig_dev_activity() hook)
+
+  trigger - echo'ing <major>:<minor> will fire the trigger for this
+            device
-- 
2.5.3

