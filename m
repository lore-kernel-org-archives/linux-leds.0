From: Matt Ranostay <mranostay@gmail.com>
Subject: [PATCH RESEND 0/2] cap11xx: add LED support
Date: Tue,  4 Aug 2015 21:24:54 -0700
Message-ID: <1438748696-28452-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:34194 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750AbbHEEXh (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 5 Aug 2015 00:23:37 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: dmitry.torokhov@gmail.com
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-input@vger.kernel.org, Matt Ranostay <mranostay@gmail.com>

Several cap11xx variants have LEDs that be can be controlled, and this
patchset implements this functionality

Matt Ranostay (2):
  dt: add cap11xx LED documentation
  cap11xx: add LED support

 .../devicetree/bindings/input/cap11xx.txt          |  19 +++
 drivers/input/keyboard/cap11xx.c                   | 140 ++++++++++++++++++++-
 2 files changed, 156 insertions(+), 3 deletions(-)

-- 
1.9.1
