From: Jiri Kosina <jikos@kernel.org>
Subject: Re: [PATCH 0/3] hid: thingm: Refactor driver
Date: Wed, 2 Mar 2016 10:24:13 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1603021023560.3656@cbobk.fhfr.pm>
References: <56D4AB59.1060303@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33585 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751501AbcCBJYQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 2 Mar 2016 04:24:16 -0500
In-Reply-To: <56D4AB59.1060303@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-leds@vger.kernel.org, linux-input@vger.kernel.org

On Mon, 29 Feb 2016, Heiner Kallweit wrote:

> This patch series reflects a recent change in the LED core regarding
> workqueue usage, simplifies the driver and improves locking.
> 
> Heiner Kallweit (3):
>   hid: thingm: remove workqueue
>   hid: thingm: switch to managed version of led_classdev_register
>   hid: thingm: improve locking

I've applied 1/3, 2/3 and v2 3/3. Thanks!

-- 
Jiri Kosina
SUSE Labs
