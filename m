From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 0/2] Multicolor Documentation update
Date: Mon, 1 Jul 2019 15:46:32 -0500
Message-ID: <20190701204634.10517-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Hello

After some off line conversations with the LED maintainers I update the
documentation for the multicolor framework with what I hope to be a good
compromise.

I have add the "color_mix" (name is not set but could not think of a better one)
file for writing the monochrome LEDs as a group.  Also I have added a "color_id"
file for each monochrome LED as read only so that the LED indexes in the array 
are known when writing to the color_mix file.  This will help in determining the
order of the LEDs in the array.

I am not carrying any RoB/SoB in this patchset as these interfaces are changing.

Dan

Dan Murphy (2):
  leds: multicolor: Add sysfs interface definition
  documention: leds: Add multicolor class documentation

 .../ABI/testing/sysfs-class-led-multicolor    |  67 ++++++++
 Documentation/leds/leds-class-multicolor.txt  | 145 ++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-multicolor
 create mode 100644 Documentation/leds/leds-class-multicolor.txt

-- 
2.22.0.214.g8dca754b1e
