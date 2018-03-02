From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: [PATCH v12] ath10k: add LED and GPIO controlling support for
 various chipsets
Date: Fri, 2 Mar 2018 10:22:14 +0100
Message-ID: <e77d25d4-a824-380a-c51a-e81175ba6205@dd-wrt.com>
References: <20180226084406.2093-1-s.gottschall@dd-wrt.com>
 <CACna6rzD6z3DC6yjMCgBxgxx+DF+GGu69Ot5QA6xpJ41Ewb2=A@mail.gmail.com>
 <82d8ac0c-b391-6099-4c7f-991cc35445aa@dd-wrt.com>
 <20180302090312.GA30267@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180302090312.GA30267@amd>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+gldad-ath10k=m.gmane.org@lists.infradead.org
To: Pavel Machek <pavel@ucw.cz>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Sebastian Gottschall <s.gottschall@newmedia-net.de>, Kalle Valo <kvalo@codeaurora.org>
List-Id: linux-leds@vger.kernel.org

>> leds-gpio is crap and limited. you can just register one platform data at
>> kernel runtime since its identified by its object name "led-gpio" but the
>> kernel forbidds to register 2 platform datas with the same name
>> consider the ar71xx devices with qca988x wifi chipsets. they all have
>> already a led platform data registered
>> at boottime. a second can't be registered anymore so gpio_led is useless=
 at
>> all for most developers on such platforms. its mainly used for early ker=
nel
>> platform data initialisation for system leds.
> If leds-gpio has limitations, please fix those, rather then
> introducing duplicated code.
there is no duplicated code introduced and there is no solution for it. =

consider that all wifi drivers with softled support
are going that way with registering a own led driver. see ath9k for =

instance. gpio-led cannot be used for it and there is no way to
support multiple platform datas with the same name. its a kernel limitation

Sebastian
>
> NAK.
> 									Pavel


-- =

Mit freundlichen Gr=FCssen / Regards

Sebastian Gottschall / CTO

NewMedia-NET GmbH - DD-WRT
Firmensitz:  Stubenwaldallee 21a, 64625 Bensheim
Registergericht: Amtsgericht Darmstadt, HRB 25473
Gesch=E4ftsf=FChrer: Peter Steinh=E4user, Christian Scheele
http://www.dd-wrt.com
email: s.gottschall@dd-wrt.com
Tel.: +496251-582650 / Fax: +496251-5826565
