From: Bryan Wu <cooloney@gmail.com>
Subject: Re: [PATCHv2 2/2] leds: tlc59116: Driver for the TI 16 Channel i2c
 LED driver
Date: Tue, 13 Jan 2015 11:18:30 -0800
Message-ID: <CAK5ve-LS0KO4avfprz=6rS4MT5AdiAtF02EVvv=cRbz03t4E_w@mail.gmail.com>
References: <1420843545-30892-1-git-send-email-andrew@lunn.ch>
 <1420843545-30892-3-git-send-email-andrew@lunn.ch> <CAK5ve-JQJJH_Dk=+PbFyRL3cjQUU4a5au4h9Kfcz6L6_iAfPKA@mail.gmail.com>
 <20150113191349.GE14570@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:42587 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751004AbbAMTSv (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Tue, 13 Jan 2015 14:18:51 -0500
In-Reply-To: <20150113191349.GE14570@lunn.ch>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: "rpurdie@rpsys.net" <rpurdie@rpsys.net>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux ARM <linux-arm-kernel@lists.infradead.org>, kaloz@openwrt.org, Matthew.Fatheree@belkin.com

On Tue, Jan 13, 2015 at 11:13 AM, Andrew Lunn <andrew@lunn.ch> wrote:
> On Tue, Jan 13, 2015 at 10:55:23AM -0800, Bryan Wu wrote:
>> On Fri, Jan 9, 2015 at 2:45 PM, Andrew Lunn <andrew@lunn.ch> wrote:
>> > The TLC59116 is an I2C bus controlled 16-channel LED driver.  Each LED
>> > output has its own 8-bit fixed-frequency PWM controller to control the
>> > brightness of the LED.
>> >
>> > This is based on a driver from Belkin, but has been extensively
>> > rewritten.
>> >
>> > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
>> > Cc: Matthew.Fatheree@belkin.com
>>
>> Looks good, applied to my tree.
>
> Great, thanks.
>
> Will you also take the device tree binding document patch?
>
> Thanks
>         Andrew

Can you update that one without that gpio thing in the example? And if
there is no objection from others, I will take it.

-Bryan
