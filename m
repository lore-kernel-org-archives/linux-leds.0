From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Tue, 21 Feb 2017 16:13:17 +0100
Message-ID: <20170221151317.GN9795@pali>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-8-hdegoede@redhat.com>
 <20170221141108.GG9795@pali>
 <d1639790-24a3-8c81-651b-c8c8940ceeb5@redhat.com>
 <20170221145043.GK9795@pali>
 <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:34667 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751320AbdBUPNU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 21 Feb 2017 10:13:20 -0500
Content-Disposition: inline
In-Reply-To: <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On Tuesday 21 February 2017 15:56:43 Hans de Goede wrote:
> >So do we really need this code which prevents update?
> 
> Yes, because the ABI specification for the new brightness_hw_changed says
> that poll() listeners will only be woken up if the brightness is changed
> outside of the kernel and not when the kernel changes it itself.

So in case there are two applications in userspace which want to monitor
brightness change and both of those application could change brightness
(via sysfs) then these two applications would not know about every
brightness change and would be out-of-sync of reality what is really
configured by kernel.

This is one part which I did not liked in proposed ABI as it force
userspace to choose and use only one brightness monitoring application
at same time.

Plus if ABI was specified that poll() could be used only for hardware
change (and not by software e.g. kernel/userspace) then such
functionality is not possible to implement for Dell machines. As it
looks like Dell firmware send event about every change of brightness and
we cannot distinguish if change was done by software (kernel) or by
hardware itself.

I do not know now if you already accepted that ABI, I'm just saying that
I do not like it due to requirement for one userspace application as
listener and also because it is not what can be used for Dell machines.

Jacek, was this requirement in ABI already accepted into stable?

-- 
Pali Rohár
pali.rohar@gmail.com
