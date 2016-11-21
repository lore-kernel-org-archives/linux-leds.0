From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 1/6] leds: triggers: Add current_brightness trigger
 parameter
Date: Mon, 21 Nov 2016 11:02:58 +0100
Message-ID: <20161121100258.GB13735@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <201611210007.35417@pali>
 <20161120234842.GA30717@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:33875 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752389AbcKUKDB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Nov 2016 05:03:01 -0500
Content-Disposition: inline
In-Reply-To: <20161120234842.GA30717@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On Monday 21 November 2016 00:48:42 Pavel Machek wrote:
> On Mon 2016-11-21 00:07:35, Pali Rohár wrote:
> > On Thursday 17 November 2016 23:24:36 Hans de Goede wrote:
> > > In some cases it may be desirable for userspace to be notified when
> > > a trigger event happens. This commit adds support for a poll-able
> > > current_brightness trigger specific sysfs attribute which triggers
> > > may register:
> > > 
> > > What:		/sys/class/leds/<led>/current_brightness
> > 
> > What about name actual_brightness? That name is already used by 
> > /sys/class/backlight/...
> 
> Is that a problem?

Is not better to have same name?

-- 
Pali Rohár
pali.rohar@gmail.com
