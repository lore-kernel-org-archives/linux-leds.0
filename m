From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] leds: core: Add led_notify_brightness_change helper
 function
Date: Wed, 19 Oct 2016 18:07:47 +0200
Message-ID: <e6f111e6-f921-4f96-3d21-89a16774880a@redhat.com>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-2-hdegoede@redhat.com> <20161019135958.GE1689@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:17595 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S943656AbcJSQHw (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 Oct 2016 12:07:52 -0400
In-Reply-To: <20161019135958.GE1689@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 19-10-16 15:59, Pali Rohár wrote:
> On Wednesday 19 October 2016 15:33:54 Hans de Goede wrote:
>> +		itself and the driver can detect this. Changes done by
>> +		kernel triggers / software blinking and writing the brightness
>> +		file are not signalled.
>
> Why? In case you have desktop application which show current brightness
> level and you change manually it via echo something > /sys/ then that
> application does not have any information about your change. And so it
> show old value...

Well it seems like a bad idea to me to notify on changes caused by
triggers and blinking, even though those are visible under sysfs
if polling the brightness attribute. At which point it seemed to make
sense to only notify on changes done autonomously by the hardware,
rather then from any software (running on the main CPU).

As for specifically not notifying on write, the sysfs interface is root only,
so usually there will be a single daemon controlling the brightness,
and any users can go through that daemon and it can distribute change
messages itself (and will do so for the POLL_PRI events).

Since the usual use case is a single writing process, which is also
the same single process listening for POLL_PRI, it seems unnecessary
to me to notify the process about the write it has just done.

But if people think that we should consider multiple simultaneous
users (which seems like a bad idea to me, because of coordination
issues, but the API does allow it) and therefor should notify
of the brightness change on a write, I'm fine with doing a new
version implementing those semantics instead.

Either way notifying on brightness changes caused by triggers /
blinking seems like a bad idea to me.

Regards,

Hans
