From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/7] Move dell-led to drivers/platform/x86
Date: Thu,  8 Dec 2016 13:36:11 +0100
Message-ID: <20161208123618.28603-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This patch series moves the dell-led driver from the LED subsystem to
the x86 platform driver subsystem.  I decided to also CC the sound
subsystem contacts for the whole series as
sound/pci/hda/dell_wmi_helper.c is also affected.

The original motivation behind this effort was to move all code using
the dell-smbios module to the x86 platform driver subsystem.  While I
was investigating the possibilites to do that, it quickly emerged that
dell-led can and in fact should be moved to the x86 platform driver
subsystem in its entirety.

dell-led consists of two major parts:

  - the part exposing a microphone mute LED interface, introduced in
    db6d8cc ("dell-led: add mic mute led interface"); this interface is
    used by sound/pci/hda/dell_wmi_helper.c; while the original
    implementation used a WMI interface, it was changed to use
    dell-smbios in cf0d7ea ("dell-led: use dell_smbios_find_token() for
    finding mic DMI tokens") and 0c41a08 ("dell-led: use
    dell_smbios_send_request() for performing SMBIOS calls"),

  - the part handling an activity LED present in Dell Latitude 2100
    netbooks, introduced in 72dcd8d ("leds: Add Dell Business Class
    Netbook LED driver"); it binds to a specific WMI GUID and then
    registers a LED device which is controlled using WMI (i.e. it is
    basically a WMI driver).

Patches 1-4 clean up the microphone mute LED interface to minimize the
amount of code moved around.
  
Patch 5 moves the microphone mute LED interface to
drivers/platform/x86/dell-laptop.c, effectively causing
sound/pci/hda/dell_wmi_helper.c to depend on CONFIG_DELL_LAPTOP instead
of CONFIG_LEDS_DELL_NETBOOKS.
    
Patch 6 reverts dell-led to the state it was in after its initial commit
72dcd8d ("leds: Add Dell Business Class Netbook LED driver") by removing
all remnants of the microphone mute LED handling code.

Patch 7 moves all that is left of dell-led (i.e. the activity LED part,
as originally implemented), to a new module which is placed in
drivers/platform/x86/dell-wmi-led.c.

This patch series is based on linux-leds/for-4.11 as the LED subsystem
is affected by all patches except patch 3.

If anyone reading this has access to a Dell device which has an activity
LED and/or a microphone mute LED currently supported by dell-led, I
would love to hear from you as I do not have the hardware needed to
practically test this patch series.

 drivers/leds/Kconfig                               |  9 ---
 drivers/leds/Makefile                              |  1 -
 drivers/platform/x86/Kconfig                       |  8 +++
 drivers/platform/x86/Makefile                      |  1 +
 drivers/platform/x86/dell-laptop.c                 | 28 ++++++++
 .../dell-led.c => platform/x86/dell-wmi-led.c}     | 75 +++-------------------
 include/linux/dell-led.h                           |  6 +-
 sound/pci/hda/dell_wmi_helper.c                    | 18 +++---
 8 files changed, 55 insertions(+), 91 deletions(-)
 rename drivers/{leds/dell-led.c => platform/x86/dell-wmi-led.c} (73%)

-- 
2.10.2
