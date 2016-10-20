From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Thu, 20 Oct 2016 10:42:44 +0200
Message-ID: <2f1063df-f55a-a6b2-3e7e-ecfbf7955633@redhat.com>
References: <20161019133355.6192-1-hdegoede@redhat.com>
 <20161019133355.6192-3-hdegoede@redhat.com> <20161019140614.GF1689@pali>
 <10c3baa9-db2f-3cf2-d924-70a77243e7f8@redhat.com>
 <20161020074843.GI1689@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52122 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934208AbcJTIm6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 20 Oct 2016 04:42:58 -0400
In-Reply-To: <20161020074843.GI1689@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 20-10-16 09:48, Pali Rohár wrote:
> On Wednesday 19 October 2016 18:09:27 Hans de Goede wrote:
>> I agree that this is not pretty, but I could not come up with a
>> simple other solution. If you've any suggestions on how you want
>> to see this implemented instead I can give that a try.
>
> I was thinking about exporting some dell_wmi_notifier_register and
> unregister functions (based on atomic_notifier_chain_register) from
> dell-wmi. And dell-laptop could use it. Something similar is already
> implemented in dell-rbtn+dell-latop, but still I'm consider it as hack.
>
> This one in dell-wmi could be easier as dell-rbtn because dell-wmi is
> monolitic. dell-wmi could be loaded only on systems which support it, so
> at that register call (from dell-laptop) you already know if you receive
> events or not.

Ok, I will take a look at this once we've figured out the kernel led interface
to notify userspace of these changes.

Regards,

Hans
