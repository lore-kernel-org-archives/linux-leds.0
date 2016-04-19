From: Olliver Schinagl <oliver@schinagl.nl>
Subject: [PATCHv1 0/6] leds: pca9653x: support inverted outputs and cleanups
Date: Tue, 19 Apr 2016 09:40:44 +0200
Message-ID: <1461051650-18824-1-git-send-email-oliver@schinagl.nl>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Olliver Schinagl <oliver@schinagl.nl>
List-Id: linux-leds@vger.kernel.org

Using the pca963x for a while, I noticed something that may look like some
i2c accessing issues where sometimes data was incorrectly written to the bus,
possibly because we where not properly locking the i2c reads. Though I'm not
familiar enough with the i2c framework to be certain reads need to be locked
at all. A patch was added to properly lock i2c access more tightly.

Furthermore there was no method to support inverted outputs. This series
adds a property to the device tree to inform the driver that the output
is inverted (active-high vs active-low).

Additionally, this patch set does some cleanups to please checkpatch, and
removes a few magic values.

Olliver Schinagl (6):
  leds: pca963x: Alphabetize headers
  leds: pca963x: Lock i2c r/w access
  leds: pca963x: Add defines and remove some magic values
  leds: pca963x: Reduce magic values
  leds: pca963x: Inform the output that it is inverted
  leds: pca963x: Remove whitespace and checkpatch problems

 Documentation/devicetree/bindings/leds/pca963x.txt |   1 +
 drivers/leds/leds-pca963x.c                        | 243 ++++++++++++++-------
 include/linux/platform_data/leds-pca963x.h         |   1 +
 3 files changed, 171 insertions(+), 74 deletions(-)

-- 
2.8.0.rc3
