From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [PATCH v2] leds: leds-fsg: Use devm_led_classdev_register
Date: Mon, 24 Aug 2015 10:17:24 +0200
Message-ID: <55DAD314.1030802@samsung.com>
References: <20150818142016.GA2549@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20150818142016.GA2549@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Vaishali Thakkar <vthakkar1994@gmail.com>
Cc: Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 08/18/2015 04:20 PM, Vaishali Thakkar wrote:
> Use resource-managed function devm_led_classdev_register instead
> of led_classdev_register to make the error-path simpler.
>
> To be compatible with the change, various gotos are replced with
> direct returns and unneeded labels are dropped. Also, remove
> fsg_led_remove as it is now redundant.
>
> Signed-off-by: Vaishali Thakkar <vthakkar1994@gmail.com>
> ---
> Changes since v1:
> 	- Fix build errors
> ---
>   drivers/leds/leds-fsg.c | 52 ++++++++++++-------------------------------------
>   1 file changed, 12 insertions(+), 40 deletions(-)

Merged, thanks.

-- 
Best Regards,
Jacek Anaszewski
