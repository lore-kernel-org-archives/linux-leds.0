From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 4.4 16/34] led: core: Fix brightness setting when setting
 delay_off=0
Date: Wed, 7 Mar 2018 21:39:08 +0100
Message-ID: <86d4536e-11d5-40c4-4186-21955f809005@gmail.com>
References: <20180302084435.842679610@linuxfoundation.org>
 <20180302084437.007951262@linuxfoundation.org>
 <1520436743.23626.33.camel@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1520436743.23626.33.camel@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Hutchings <ben.hutchings@codethink.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Matthieu CASTET <matthieu.castet@parrot.com>
Cc: stable@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi Ben,

On 03/07/2018 04:32 PM, Ben Hutchings wrote:
> On Fri, 2018-03-02 at 09:51 +0100, Greg Kroah-Hartman wrote:
>> 4.4-stable review patch.  If anyone has any objections, please let me
>> know.
>>
>> ------------------
>>
>> From: Matthieu CASTET <matthieu.castet@parrot.com>
>>
>>
>> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
>>
>> With the current code, the following sequence won't work :
>> echo timer > trigger
>>
>> echo 0 >  delay_off
>> * at this point we call
>> ** led_delay_off_store
>> ** led_blink_set
> [...]
> 
> The commit message got cut truncated here, which resulted in addresses
> being omitted when it was sent out for review.  The upstream commit
> message refers to a LED_BLINK_SW flag which is not used in 4.4.  So
> this fix probably isn't needed, though I can't tell whether it does any
> harm.

We discussed it in [0]. This patch is not needed for 4.4 and what's
more more it is harmful. It introduces a bug, fixed in [1].

[0] https://lkml.org/lkml/2018/2/6/726
[1[ https://patchwork.kernel.org/patch/10253933/

-- 
Best regards,
Jacek Anaszewski
