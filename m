From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] ARM: Kirkwood: add modes-map property to ns2-leds
 nodes
Date: Tue, 28 Jul 2015 13:34:51 +0200
Message-ID: <55B768DB.3040409@gmail.com>
References: <1435859803-19583-1-git-send-email-simon.guinot@sequanux.org> <1435859803-19583-3-git-send-email-simon.guinot@sequanux.org> <55B3A047.70905@free-electrons.com> <55B75A2E.4080803@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B75A2E.4080803-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Simon Guinot <simon.guinot-jKBdWWKqtFpg9hUCZPvPmw@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org



On 28.07.2015 12:32, Gregory CLEMENT wrote:
> Hi Simon, Jacek,
>
> On 25/07/2015 16:42, Gregory CLEMENT wrote:
>> Hi Simon, Jacek, Bryan, Richard,
>>
>> On 02/07/2015 19:56, Simon Guinot wrote:
>>> From: Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>
>>> Since the LED modes mapping is no longer hardcoded inside the leds-ns2
>>> driver, then it must be provided through the modes-map property in the
>>> ns2-leds nodes.
>>>
>>> Signed-off-by: Vincent Donnefort <vdonnefort-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> As the other patch of the series seem to be merged in the led branch,
>> then I can apply this patch on mvebu/dt.
>>
>> It is OK for being in linux-next, however this patch depend on "leds:
>> leds-ns2: move LED modes mapping outside of the driver", so I will need
>> to find a way to express this dependency when I will do the pull request
>> to arm-soc.
>>
>
> Eventually I removed this patch from my branch.
> Jacek, you can take it with my
>
> Acked-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>

OK, I'll take it with your ack.

-- 
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
