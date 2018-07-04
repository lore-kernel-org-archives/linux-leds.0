From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] leds: ledtrig-morse: send out morse code
Date: Wed, 4 Jul 2018 19:25:28 +0300
Message-ID: <CAHp75VcPAdTQKreEChrnS=izjb+vKGLMT5mYYEXCoxGs+eRzeQ@mail.gmail.com>
References: <20180703155328.GA18299@arbeit> <CAHp75VcQmUPCqzteHs=EaA5h-ABAQ=GWuLVRGWL3meMKZBJ-iQ@mail.gmail.com>
 <20180704024112.GB9015@1wt.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180704024112.GB9015@1wt.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Tarreau <w@1wt.eu>
Cc: Andreas Klinger <ak@it-klinger.de>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, ben.whitten@gmail.com, Geert Uytterhoeven <geert+renesas@glider.be>, Philippe Ombredanne <pombredanne@nexb.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Jul 4, 2018 at 5:41 AM, Willy Tarreau <w@1wt.eu> wrote:
> On Tue, Jul 03, 2018 at 09:43:06PM +0300, Andy Shevchenko wrote:

> Well, in this case it's even possible to go further and avoid storing
> 36 strings. Indeed, no representation is longer than 5 symbols, so you
> can use 5 bits for the encoding (0=".", 1="-") and 3 bits for the
> length, it gives you a single byte per character instead of a pointer
> to a string plus 6 chars. Then in order to make it readable, 5 macros
> can be provided to emit the code :
>

Even further something like

#define MORSE_PACK(len, code)   ((code << 3) | len)

> #define MORSE1(a,b)       (1 | ((a)<<3))
> #define MORSE2(a,b)       (2 | ((a)<<3)|((b)<<4))
> #define MORSE3(a,b,c)     (3 | ((a)<<3)|((b)<<4)|((c)<<5))
> #define MORSE4(a,b,c,d)   (4 | ((a)<<3)|((b)<<4)|((c)<<5)|((d)<<6))
> #define MORSE5(a,b,c,d,e) (5 | ((a)<<3)|((b)<<4)|((c)<<5)|((d)<<6)|((e)<<7))
>
> Then all chars may be defined like this :
>
>     ['a'] = MORSE2(0,1),
>     ['b'] = MORSE4(1,0,0,0),
>     ['c'] = MORSE4(1,0,1,0),
>     ['d'] = MORSE3(1,0,0),
>     ['e'] = MORSE1(0),
>     ...
>
> and when processing these :
>
>     code = morse_table[tolower(c)];
>     code_len = code & 7;
>     code >>= 3;
>
>     while (code_len) {
>        if (code & 1)
>            emit_long();
>        else
>            emit_short();
>        code >>= 1;
>        code_len--;
>     }

Nice!

> In this case it could even cover the whole ASCII table at once since it's
> not certain that the saved bytes compensate for the extra code and alignment
> used to save them :-)
>
> Note that I'm not suggesting that it is required to proceed like this, but
> I think it makes the whole code more compact, which aligns with the purpose
> of focusing on embedded devices.

-- 
With Best Regards,
Andy Shevchenko
