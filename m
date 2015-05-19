From: Sakari Ailus <sakari.ailus@iki.fi>
Subject: [PATCH 0/5] V4L2 flash API wrapper improvements
Date: Wed, 20 May 2015 02:04:00 +0300
Message-ID: <1432076645-4799-1-git-send-email-sakari.ailus@iki.fi>
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: linux-leds@vger.kernel.org, j.anaszewski@samsung.com, cooloney@gmail.com, g.liakhovetski@gmx.de, s.nawrocki@samsung.com, laurent.pinchart@ideasonboard.com, mchehab@osg.samsung.com
List-Id: linux-leds@vger.kernel.org

Hi Jacek, Mauro, others,

The first patch in this set adds the of_node pointer to struct v4l2_subdev
in order to match an async sub-device based on an explicit OF node instead
of the device's OF node, where the former is typically a child of the
latter.

Mauro: would you be ok with this patch going through the LED tree as well?
The rest of the patches in the set depend on this one. There are currently
no conflicts with media-tree master branch.

The rest of the patches (2--5) are intended to be merged with Jacek's
patches here:

<URL:http://www.spinics.net/lists/linux-media/msg88999.html>

Jacek: if you're ok with the patches, could you merge them with appropriate
patches in your set, please? The patches have not been tested since I don't
have the hardware.

-- 
Kind regards,
Sakari
