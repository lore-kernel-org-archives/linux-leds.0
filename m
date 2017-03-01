From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Wed, 1 Mar 2017 12:15:58 +0100
Message-ID: <20170301111558.GC3185@pali>
References: <20170221145043.GK9795@pali>
 <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
 <20170221151317.GN9795@pali>
 <af30d146-8eb3-fbf7-7041-e719d8f9a5ac@redhat.com>
 <20170221170838.GO9795@pali>
 <7bb7c48f-789e-8b4c-b76b-1389d7fbbfb7@redhat.com>
 <20170222084935.GA21558@pali>
 <cf1aceaf-9177-2223-6f36-afdb5c47ee31@redhat.com>
 <20170222120109.GC21558@pali>
 <035b56e6-b606-c632-35cf-00f880abcbf5@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34420 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752324AbdCALQx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Mar 2017 06:16:53 -0500
Content-Disposition: inline
In-Reply-To: <035b56e6-b606-c632-35cf-00f880abcbf5@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

On Wednesday 22 February 2017 13:20:46 Hans de Goede wrote:
> 1) These events do not happen 100s of times per second, they happen
> almost never

100 events per second is probably not happening, but on my Latitude I
see that sometimes more events are delayed and delivered at once.

> 2) This is the best we can do given the firmware interface we have

What about just dropping upcoming one event in interval of next 2-3
second? Instead of trying to remember last state in kernel and then
trying to mach if received event was that which was caused by change?

This would allow us to reduce doing one SMM call for each received
event and I think it would be same reliable as your approach.

-- 
Pali Rohár
pali.rohar@gmail.com
