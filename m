From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 2/6] leds: triggers: Add a keyboard backlight trigger
Date: Mon, 21 Nov 2016 11:12:09 +0100
Message-ID: <20161121101209.GC13735@pali>
References: <20161117222441.31464-1-hdegoede@redhat.com>
 <55cdf83d-2233-151f-08e1-11d4619e8fd5@redhat.com>
 <7b8252c4-bb2a-01dd-2404-9b81c192fb6a@gmail.com>
 <CGME20161120150524epcas2p1f634a13bf220f21e7dd95b272b28594c@epcas2p1.samsung.com>
 <201611201605.17631@pali>
 <d6b177fc-313f-6597-4c8c-fc3c6f48778a@samsung.com>
 <2e1ddcc3-489d-bab1-ebb9-dad02db7b37c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2e1ddcc3-489d-bab1-ebb9-dad02db7b37c@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Richard Purdie <rpurdie@rpsys.net>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

On Monday 21 November 2016 10:31:33 Hans de Goede wrote:
> Pali, I'm sorry that you don't like the LED side design, but there
> has been a long discussion about this (which you apparently missed)
> and this really is the best way forward.

Yea, I thought that I should have missed something as I was not able to
find all needed information about it in my mailbox.

Is that discussion somewhere logged/available? That could help to
describe and understand all problems hidden behind.

> Have you looked at what the new design means for the platform/x86
> patches ? Gone is the ugly dell_laptop_notifier as the event
> forwarding between dell-wmi and dell-laptop is now handles by
> the led-trigger subsys.

Yes, I saw that ugly dell_lpatop notifier is not there. If there is some
more information about decision and pro/coins about this approach I
would like to read it before.

-- 
Pali Rohár
pali.rohar@gmail.com
