From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: Workqueue core implementation
Date: Thu, 29 Oct 2015 17:59:07 +0100
Message-ID: <20151029165905.GA15462@ns3274321.ip-5-39-88.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:38151 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752640AbbJ2RGG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 29 Oct 2015 13:06:06 -0400
Received: by wmeg8 with SMTP id g8so28731989wme.1
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2015 10:06:04 -0700 (PDT)
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: j.anaszewski@samsung.com
Cc: linux-leds@vger.kernel.org, simon.guinot@sequanux.org

Hi Jacek,

I saw on your git branch "linux-leds/devel" that you are working on a
core solution for workqueues with the new led_set_brightness_nopm()
function and thus you are removing workqueues from leds-* drivers.

Since I'll need to add GPIO can_sleep support to a LED driver, I'm
interested to know when are you planning to merge this work, to avoid
to submit a patch to add workqueue which will be quickly deprecated.

Thanks,
Vincent.
