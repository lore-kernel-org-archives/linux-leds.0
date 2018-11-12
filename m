From: =?UTF-8?B?VmVzYSBKw6TDpHNrZWzDpGluZW4=?= <dachaac@gmail.com>
Subject: Re: [PATCH 03/24] leds: dt-bindings: Add LED_FUNCTION definitions
Date: Mon, 12 Nov 2018 02:25:28 +0200
Message-ID: <fb4139e2-53ae-0a02-df8d-2fe7c6d32194@gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541542052-10081-4-git-send-email-jacek.anaszewski@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Linus Walleij <linus.walleij@linaro.org>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>, Xiaotong Lu <xiaotong.lu@spreadtrum.com>
List-Id: linux-leds@vger.kernel.org

Hi Jacek,

On 07/11/2018 0.07, Jacek Anaszewski wrote:
> Add common LED function definitions for use in Device Tree.
> The function names were extracted from existing dts files
> after eliminating oddities.

Is your intent here is to standardize the function definitions and to 
aid in that is to specify list of string defines?

Without a meaning what all of those mean it does complete the original goal.

In your list there are many things that could easily have multiple 
meanings for different audiences.

Some examples:

#define LED_FUNCTION_2G "2g"
- Does this mean that 2 metric grams has been detected in scale or 
cellular 2G connectivity?

#define LED_FUNCTION_ALL "all"
- This doesn't ring a bell to me what it could be in reality. All leds 
on doesn't sound right.

#define LED_FUNCTION_AUX "aux"
- There can be many things aux and multiple aux things in one device.

#define LED_FUNCTION_HD "hd"
- Is there a high definition video playing? Or audio? Or harddisk 
failure led?

You have already come up with long list of items. I am just wondering 
what is the logic in order to get to "common" list?

Can you just add custom items in device tree without being in the list?

Would it be better to start with a short simple list with meanings 
defined properly?

When do you then remove entries from the list? Let's say 3G networks are 
currently getting turned off world wide which kinda deprecates the term 
from definitions and probably should be then removed from the list (if 
it would be there).

Is there planned to be some auto connection from function to some other 
automated functionality? Or why wouldn't the label keyword be enough as 
it seems to be exactly the same thing? (without the common list -- which 
could be implemented for label too if seen as a good thing)

Thanks,
Vesa Jääskeläinen
