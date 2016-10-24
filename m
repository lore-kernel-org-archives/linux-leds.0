From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] platform: x86: dell-smbios: Add a generic
 dell-smbios notifier chain
Date: Mon, 24 Oct 2016 15:45:02 +0200
Message-ID: <762cceac-d807-0c3d-7469-267cc850f874@redhat.com>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <20161023194652.24335-2-hdegoede@redhat.com> <20161024133105.GC12154@pali>
 <4cdb7bb1-2b16-e009-3309-433b1a306d54@redhat.com>
 <20161024134339.GE12154@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53136 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934306AbcJXNpH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 24 Oct 2016 09:45:07 -0400
In-Reply-To: <20161024134339.GE12154@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 24-10-16 15:43, Pali Rohár wrote:
> On Monday 24 October 2016 15:37:31 Hans de Goede wrote:
>> Well WMI events get enabled via a SMBIOS call,
>
> This is truth only for few laptops and only for one WMI event.
> Everything else is automatically enabled, no call is needed to issue.
>
>> and dell-laptop uses SMBIOS exclusively
>
> IIRC dell-led.ko uses also dell-smbio.ko, so it is not exclusive for
> dell-laptop.
>
>> so it seems to fit. Basically this is a case of
>> we have to put this somewhere and dell-smbios is the best fit IMHO.
>
> Agree, we need to put it somewhere...
>
> Basically we need to solve problem how (currently) 3 kernel modules can
> communicate. Does not kernel support such "bus/event" mechanism for
> this?

Yes it does, that is exactly what notifiers are for, but we need to
declare the bus somewhere. I still believe dell-smbios is the best
place.

Regards,

Hans
