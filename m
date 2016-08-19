From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND] leds: centralize definition of "default-state"
 property
Date: Fri, 19 Aug 2016 21:10:58 +0200
Message-ID: <57B759C2.4040509@gmail.com>
References: <1471376496-8706-1-git-send-email-linus.walleij@linaro.org>
 <20160818192542.GA29941@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160818192542.GA29941@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

On 08/18/2016 09:25 PM, Rob Herring wrote:
> On Tue, Aug 16, 2016 at 09:41:36PM +0200, Linus Walleij wrote:
>> Four different drivers define the "default-state" property.
>> Move this into the common.txt common LEDs properties.
>>
>> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>> Resending trying to get attention from the devicetree
>> maintainers.
>> ---
>>   Documentation/devicetree/bindings/leds/common.txt           | 7 +++++++
>>   Documentation/devicetree/bindings/leds/leds-bcm6328.txt     | 2 +-
>>   Documentation/devicetree/bindings/leds/leds-bcm6358.txt     | 2 +-
>>   Documentation/devicetree/bindings/leds/leds-gpio.txt        | 9 ++-------
>>   Documentation/devicetree/bindings/leds/register-bit-led.txt | 9 ++-------
>>   5 files changed, 13 insertions(+), 16 deletions(-)
>
> I'm assuming Jacek will take this. If not, let me know.
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
