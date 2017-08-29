From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: gpio: Add optional
 retain-state-shutdown property
Date: Tue, 29 Aug 2017 21:13:05 +0200
Message-ID: <f7a7f905-3743-0c83-affd-a9ec7e20159f@gmail.com>
References: <20170828001711.19662-1-andrew@aj.id.au>
 <20170828001711.19662-2-andrew@aj.id.au> <20170828101952.GE18012@amd>
 <CAK_vbW2BJjKa0dKoVjbRE++-2VB+3fM0DQ7u3DnwD2Tj-4bY7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK_vbW2BJjKa0dKoVjbRE++-2VB+3fM0DQ7u3DnwD2Tj-4bY7w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brandon Wyman <bjwyman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
Cc: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, OpenBMC Maillist <openbmc-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Brandon,

On 08/28/2017 11:13 PM, Brandon Wyman wrote:
> On Mon, Aug 28, 2017 at 5:19 AM, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org> wrote:
>> On Mon 2017-08-28 09:47:10, Andrew Jeffery wrote:
>>> On Baseboard Management Controller (BMC) systems it's sometimes
>>> necessary for a LED to retain its state across a BMC reset (which is
>>> independent of the host system state). Add a devicetree property to
>>> describe this behaviour. The property would typically be used in
>>> conjunction with 'default-state = "keep"'.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
>>
>> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>>
>> --
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
> 
> Tested-by: Brandon Wyman <bjwyman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Added this tag to both patches (1/2 and 2/2), thanks.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
