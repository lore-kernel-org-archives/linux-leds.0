From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v2] leds: leds-gpio: Fix multiple instances registration
 when 'label' property is absent
Date: Thu, 04 Dec 2014 02:29:40 +0100
Message-ID: <547FB904.8050207@intel.com>
References: <1417629453-25719-1-git-send-email-festevam@gmail.com> <CACxGe6srjVUAxXEahDMPGNYKn7O-TqoExwGrGkDE9bb1tiA-jA@mail.gmail.com> <CAOMZO5AEk=oAF4vxNFgd01hZqE7JH30H71OAUeBdSPavELD4aw@mail.gmail.com> <CAK5ve-+_q+DZzgkJNAiFK88+5jg6+Trh9ih7z5pEfdormjx_mQ@mail.gmail.com> <CAOMZO5ARRGzMUuOUPp8VJHuZP5Lh1Cf=xFZqih86RqUjPLQxFA@mail.gmail.com> <CAK5ve-LQs9jZCXS1fLWv0yg9oeax8RoMGW0nAJnRyxUdWCKi1A@mail.gmail.com> <CAOMZO5AbRfA6hAkS5Vx-u1iwqggWhUAr1fy-fX1QNhW3yzkMqw@mail.gmail.com> <CAK5ve-LZ7TGAHYPSBkdfngkqjo5gxc2QEcfqkv4-Lw47m7P4gw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:44384 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750833AbaLDB3o (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Wed, 3 Dec 2014 20:29:44 -0500
In-Reply-To: <CAK5ve-LZ7TGAHYPSBkdfngkqjo5gxc2QEcfqkv4-Lw47m7P4gw@mail.gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Fabio Estevam <festevam@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Richard Purdie <rpurdie@rpsys.net>, Jean-Michel Hautbois <jean-michel.hautbois@vodalys.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linux LED Subsystem <linux-leds@vger.kernel.org>, Fabio Estevam <fabio.estevam@freescale.com>

On 12/4/2014 2:00 AM, Bryan Wu wrote:
> On Wed, Dec 3, 2014 at 4:50 PM, Fabio Estevam <festevam@gmail.com> wrote:
>> On Wed, Dec 3, 2014 at 10:48 PM, Bryan Wu <cooloney@gmail.com> wrote:
>>
>>> I got it. Actually we are talking about the same patch in the email [PATCH v2].
>>> So I agree to merge this fix firstly and then introduce a new fwnode_get_name().
>>>
>>> If it's OK, I will merge this patch with Grant's Ack.
>> Excellent, thanks!
> Oh, I just found PATCH "leds: leds-gpio: Make use of device property
> API" is not in my tree. So probably Rafael should take it with my Ack
> as well:
>
> Acked-by: Bryan Wu <cooloney@gmail.com>

Applied, thanks!
