From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: dts: add PM8058 LEDs to the APQ8060 Dragonboard
Date: Thu, 18 Aug 2016 15:10:39 +0200
Message-ID: <CACRpkdYHu1rj81=_miq6Rtb+mkbdPSvULau0ojDC74wPo7hDAg@mail.gmail.com>
References: <1471376759-9561-1-git-send-email-linus.walleij@linaro.org>
 <57B4D9D0.8070000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <57B4D9D0.8070000@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Andy Gross <andy.gross@linaro.org>, linux-soc@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org

On Wed, Aug 17, 2016 at 11:40 PM, Jacek Anaszewski
<jacek.anaszewski@gmail.com> wrote:

>> +                               led@48 {
>> +                                       /*
>> +                                        * The keypad LED @0x48 is routed
>> to
>> +                                        * the sensor board where it is
>> +                                        * connected to an infrared LED
>> +                                        * SFH4650 (60mW, @850nm) next to
>> the
>> +                                        * ambient light and proximity
>> sensor
>> +                                        * Capella Microsystems CM3605.
>> +                                        */
>> +                                       compatible =
>> "qcom,pm8058-keypad-led";
>> +                                       reg = <0x48>;
>> +                                       label = "proximity0";
>
>
> In DT bindings documentation it was changed to "pm8050:white:keypad" to
> adhere to the LED class device naming convention. I assume that having
> it in this form is an omission here.

Hm right. Given the usecase here, what do you say about naming
it:

"pm8058:infrared:proximitysensor"

?

Yours,
Linus Walleij
