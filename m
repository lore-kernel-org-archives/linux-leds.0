From: Tobias Doerffel <tobias.doerffel@ed-chemnitz.de>
Subject: [RFC PATCH] leds: trigger: add activity LED trigger
Date: Tue,  6 Sep 2016 14:10:45 +0200
Message-ID: <1473163848-5408-1-git-send-email-tobias.doerffel@ed-chemnitz.de>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from dd13524.kasserver.com ([85.13.135.100]:50651 "EHLO
        dd13524.kasserver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755941AbcIFMRs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Sep 2016 08:17:48 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>

This is an initial attempt to unify all kinds of activity LED
functionality in various kernel drivers by implementing an additional
layer between simple LED triggers and device drivers.

I started this project as I'm working on activity LED support for serial
ports in parallel where I mainly duplicated code from the CAN stack.
Once serial port LED support has been mainlined, there's going to be
at least one more device driver taking advantage of ledtrig-activity
besides arcnet and can.
