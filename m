From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/3] treewide: simplify getting the adapter of an I2C client, part2
Date: Mon, 10 Jun 2019 11:51:53 +0200
Message-ID: <20190610095157.11814-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

This is a small follow-up series to a larger cleanup series already
sent:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=112605
("treewide: simplify getting the adapter of an I2C client")

These drivers use a bit different but still unnecessarily complex way to
determine the adapter of a client. Thanks to Peter Rosin for pointing
them out. They have been fixed manually, no need for a coccinelle script
here. Build tested, too. From the previous cover-letter:

The I2C core populates the parent pointer of a client as:
	client->dev.parent = &client->adapter->dev;

Now take into consideration that
	to_i2c_adapter(&adapter->dev);

is a complicated way of saying 'adapter', then we can even formally
prove that the complicated expression can be simplified by using
client->adapter.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/no_to_adapter

Please apply the patches to the individual subsystem trees. There are no
dependencies.

Thanks and kind regards,

   Wolfram

Wolfram Sang (3):
  hwmon: lm90: simplify getting the adapter of a client
  leds: is31fl319x: simplify getting the adapter of a client
  of: unittest: simplify getting the adapter of a client

 drivers/hwmon/lm90.c           | 2 +-
 drivers/leds/leds-is31fl319x.c | 2 +-
 drivers/of/unittest.c          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.19.1
