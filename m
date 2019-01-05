From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 2/2] leds: lp5024: Add the LP5024/18 RGB LED driver
Date: Sat, 5 Jan 2019 13:16:11 +0100
Message-ID: <4cf79414-578e-eea7-4f46-fc8789206988@gmail.com>
References: <fd624cc1-9997-1cd5-c5cc-62e6897997cf@ti.com>
 <54f28115-0a7d-8e9c-3bec-6e91fb3981ec@gmail.com>
 <cd90f179-6c16-823f-496f-27f141e9c322@ti.com>
 <a72c11c0-949b-bdbc-df2c-4490e04a1065@gmail.com>
 <986b5105-2fdb-bd25-7c8a-ca8fd1ade821@gmail.com>
 <7f205102-e854-f1cb-cc03-1307d1cddc87@gmail.com>
 <c9f8965a-90f4-b456-8225-c70694c9f071@gmail.com>
 <cf6c0025-36e7-197b-b27a-1f31fb45cc38@gmail.com> <20190104201256.GA2931@amd>
 <a4e3a782-de76-ba91-3727-4db69cf27c3a@gmail.com> <20190104220726.GA12395@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190104220726.GA12395@amd>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, Dan Murphy <dmurphy@ti.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Pavel,

On 1/4/19 11:07 PM, Pavel Machek wrote:
> Hi!
> 
>> But, aside from that hypothetic issue, we need a solution for
>> LEDn_BRIGHTNESS feature of lp5024, i.e. setting color intensity
>> via a single register write. How would you propose to address that?
> 
> So they have hardware feature that allows control of 3 LEDs at the
> same time, right?
> 
> Actually turris routers (IIRC) have similar feature, but shared for
> all their LEDs.
> 
> I'd suggest simply ignoring that feature for now :-).

Why not use brightness file for that?

> We will need to solve RGB leds somehow, hopefully this is solved with
> it.

When? With this attitude we will procrastinate it forever.
It's been almost 3 years since first HSV patches.

I proposed rough design of LED RGB class interface in [0].
If you find it totally flawed, then please spot the problems.
If not, let's improve it and implement.

[0] https://lkml.org/lkml/2019/1/3/550

-- 
Best regards,
Jacek Anaszewski
