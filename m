From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v1 1/2] Revert "i2c: mux: pca954x: Add ACPI support for
 pca954x"
Date: Thu, 23 Mar 2017 12:21:59 +0100
Message-ID: <e4f3c6fd-3a91-ad9f-ba43-605f850d1524@axentia.se>
References: <20170321191310.32957-1-andriy.shevchenko@linux.intel.com>
 <01b7c79e-c52f-8e87-59a8-2eb17a72d733@axentia.se>
 <1490187942.19767.161.camel@linux.intel.com>
 <7d5fba14-d3f1-dfaa-ac7d-5001ccf370a1@axentia.se> <20170323100403.GA9307@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-he1eur01on0105.outbound.protection.outlook.com ([104.47.0.105]:11124
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932780AbdCWLWI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 23 Mar 2017 07:22:08 -0400
In-Reply-To: <20170323100403.GA9307@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Tin Huynh <tnhuynh@apm.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org

On 2017-03-23 11:04, Pavel Machek wrote:
> On Thu 2017-03-23 08:45:58, Peter Rosin wrote:
>> On 2017-03-22 14:05, Andy Shevchenko wrote:
>>> On Wed, 2017-03-22 at 11:23 +0100, Peter Rosin wrote:
>>>> On 2017-03-21 20:13, Andy Shevchenko wrote:
>>>>> In ACPI world any ID should be carefully chosen and registered
>>>>> officially. The commit bbf9d262a147 seems did a wrong assumption
>>>>> because
>>>>> PCA is the registered PNP ID for "PHILIPS BU ADD ON CARD". I'm
>>>>> pretty
>>>>> sure this prefix has nothing to do with the driver in question.
>>>>
>>>> [Cc: leds people, in case they know any details]
>>>>
>>>> Hmmm, a couple of questions about that "pretty sure"...
>>>
>>> I didn't neither see the *real* excerpt from DSDT nor hear anything
>>> about official IDs from Phillips.
>>>
>>>> Philips and NXP are pretty much just different faces of the same coin,
>>>> IIUC.
>>>
>>> Good to know.
>>>
>>> While I might be mistaken, I would like to remove a confusion until we
>>> get an official confirmation either in *real* existing product on the
>>> market or letter from Phillips representatives (see above).
>>
>> Right, I don't disagree with the revert at all. The IDs were
>> apparently just grabbed and, as you point out, that is not the ACPI
>> way.
>>
>> One more question though, the revert (patch 1/2) should probably be
>> queued up for current (4.11) and sent to stable as well (4.10 is the
>> only version affected), but what about patch 2/2? Is that 4.12
> 
> Sent to stable? What serious bug it fixes?

Hi Pavel,

It obviously fixes the bug that someone might start depending on these
ACPI IDs when they shouldn't, which potentially stops that someone from
later complaining when it no longer works. I thought that this was
probably serious and qualified under "oh, that's not good". Because
regressions are nasty. Now that I look closer on the stable rules I
suppose it also disqualifies as it is on the theoretical side.

Also, the general tone from Andy indicates a certain amount of frustration
with the whole issue, which perhaps has no bearing on the seriousness,
but what do I know?

So, I'm still seeking guidance on how to handle these two patches.

Cheers,
peda
