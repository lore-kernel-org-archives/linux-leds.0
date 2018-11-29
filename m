From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 0/6] Introduce audio-mute LED trigger (and
	conversions to it)
Date: Thu, 29 Nov 2018 08:31:25 +0100
Message-ID: <20181129073131.4338-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: alsa-devel@alsa-project.org
Cc: Ayman Bagabas <ayman.bagabas@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

this is revised patch series for adding a new LED trigger audio-mute
and audio-micmute, and converting the HD-audio driver and the platform 
drivers to use the LED trigger instead of the ugly direct dynamic
symbol binding.

v2 series addressed a couple of issues Andy suggested, and changed the
led class dev names to "platform::xxx" as discussed in the previous
thread.

The latest version of patches are found in topic/leds-trigger branch
in my sound git tree.
  git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git

As these are cross-tree patches, the branch above is based cleanly on
v4.20-rc3.  From now on, it'll stay as an immutable branch, so feel
free to merge into other trees.


thanks,

Takashi

===

Takashi Iwai (6):
  leds: trigger: Introduce audio mute LED trigger
  platform/x86: dell-laptop: Add micmute LED trigger support
  platform/x86: thinkpad_acpi: Add audio mute LED classdev support
  ALSA: hda - Support led audio trigger
  platform/x86: dell-laptop: Drop superfluous exported function
  platform/x86: thinkpad_acpi: Drop superfluous exported function

 drivers/leds/trigger/Kconfig         |  7 +++
 drivers/leds/trigger/Makefile        |  1 +
 drivers/leds/trigger/ledtrig-audio.c | 44 ++++++++++++++++++
 drivers/platform/x86/Kconfig         |  4 ++
 drivers/platform/x86/dell-laptop.c   | 27 ++++++++---
 drivers/platform/x86/thinkpad_acpi.c | 67 +++++++++++++++++++++-------
 include/linux/dell-led.h             |  7 ---
 include/linux/leds.h                 | 20 +++++++++
 include/linux/thinkpad_acpi.h        | 16 -------
 sound/pci/hda/dell_wmi_helper.c      | 48 --------------------
 sound/pci/hda/hda_generic.c          | 31 +++++++++++++
 sound/pci/hda/hda_generic.h          |  2 +
 sound/pci/hda/patch_realtek.c        | 17 +++----
 sound/pci/hda/thinkpad_helper.c      | 43 +++---------------
 14 files changed, 194 insertions(+), 140 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-audio.c
 delete mode 100644 include/linux/dell-led.h
 delete mode 100644 include/linux/thinkpad_acpi.h
 delete mode 100644 sound/pci/hda/dell_wmi_helper.c

-- 
2.19.1
