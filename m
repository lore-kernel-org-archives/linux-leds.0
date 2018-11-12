From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Mon, 12 Nov 2018 17:01:23 +0100
Message-ID: <81853cb3-2a0a-1685-14b9-d5e02b3f5843@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
 <fb4139e2-53ae-0a02-df8d-2fe7c6d32194@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fb4139e2-53ae-0a02-df8d-2fe7c6d32194@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Hi Vesa,

On 11/12/2018 01:25 AM, Vesa Jääskeläinen wrote:
> Hi Jacek,
> 
> On 07/11/2018 0.07, Jacek Anaszewski wrote:
>> Add common LED function definitions for use in Device Tree.
>> The function names were extracted from existing dts files
>> after eliminating oddities.
> 
> Is your intent here is to standardize the function definitions and to
> aid in that is to specify list of string defines?

The calls for LED names standardization emerged some time go, and this
is just a submission of the subject for a discussion.

> Without a meaning what all of those mean it does complete the original
> goal.
> 
> In your list there are many things that could easily have multiple
> meanings for different audiences.
> 
> Some examples:
> 
> #define LED_FUNCTION_2G "2g"
> - Does this mean that 2 metric grams has been detected in scale or
> cellular 2G connectivity?

Most probably the latter. Should we have the generic macro for it
is another question. Actually I found it in the leds-tlc591xx.txt
bindings. There are also "wlan_2g" occurrences in the armada385-linksys*
dts files.

> #define LED_FUNCTION_ALL "all"
> - This doesn't ring a bell to me what it could be in reality. All leds
> on doesn't sound right.

Yeah, I must admit I didn't spend too much time assessing how much
all of them make sense. I just wanted we had more complete picture
of what functions are pre-existing in the bindings and dts files.

> #define LED_FUNCTION_AUX "aux"
> - There can be many things aux and multiple aux things in one device.
> 
> #define LED_FUNCTION_HD "hd"
> - Is there a high definition video playing? Or audio? Or harddisk
> failure led?
> 
> You have already come up with long list of items. I am just wondering
> what is the logic in order to get to "common" list?
> 
> Can you just add custom items in device tree without being in the list?
> 
> Would it be better to start with a short simple list with meanings
> defined properly?

This seems to be the most reasonable approach. My first thought was
to provide function definitions for as many as possible from the
pre-existing ones, but it is not making too much sense as it tunes out.

> When do you then remove entries from the list? Let's say 3G networks are
> currently getting turned off world wide which kinda deprecates the term
> from definitions and probably should be then removed from the list (if
> it would be there).
> 
> Is there planned to be some auto connection from function to some other
> automated functionality? 

One proposition was to register the LED for a trigger events basing on
the function name, like e.g "heartbeat".

> Or why wouldn't the label keyword be enough as
> it seems to be exactly the same thing? (without the common list -- which
> could be implemented for label too if seen as a good thing)

LED_FUNCTION definitions are not meant to be limited for use only
with color:name scheme, if that's what you had on mind.

-- 
Best regards,
Jacek Anaszewski
