From: Matthias Schiffer <mschiffer@universe-factory.net>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Mon, 12 Mar 2018 16:00:01 +0100
Message-ID: <f072a5c1-95f1-e81b-c629-ebdea723e6f4@universe-factory.net>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd> <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd> <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd> <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
 <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="VzJpYh3I0nuxSbH70Xnayo0eenXt5HtFM"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Sasha Levin <Alexander.Levin@microsoft.com>, Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VzJpYh3I0nuxSbH70Xnayo0eenXt5HtFM
Content-Type: multipart/mixed; boundary="jhuxeFKxzYQQngyk8N8bQRSGy9wMvbJdg";
 protected-headers="v1"
From: Matthias Schiffer <mschiffer@universe-factory.net>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sasha Levin <Alexander.Levin@microsoft.com>, Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Message-ID: <f072a5c1-95f1-e81b-c629-ebdea723e6f4@universe-factory.net>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd> <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
 <20180204090531.GA29468@amd> <20180204111500.GB14797@kroah.com>
 <20180204171736.GA1388@amd> <20180206020210.m6gl7vai4p6azb6s@sasha-lappy>
 <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>
In-Reply-To: <713113d8-7662-d80c-c62f-af020469d0bf@gmail.com>

--jhuxeFKxzYQQngyk8N8bQRSGy9wMvbJdg
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 02/06/2018 09:44 PM, Jacek Anaszewski wrote:
> On 02/06/2018 03:02 AM, Sasha Levin wrote:
>> On Sun, Feb 04, 2018 at 06:17:36PM +0100, Pavel Machek wrote:
>>>
>>>>>>>> *** if brightness=3D0, led off
>>>>>>>> *** else apply brightness if next timer <--- timer is stop, and =
will never apply new setting
>>>>>>>> ** otherwise set led_set_brightness_nosleep
>>>>>>>>
>>>>>>>> To fix that, when we delete the timer, we should clear LED_BLINK=
_SW.
>>>>>>>
>>>>>>> Can you run the tests on the affected stable kernels? I have feel=
ing
>>>>>>> that the problem described might not be present there.
>>>>>>
>>>>>> Hm, I don't seem to have HW to test that out. Maybe someone else d=
oes?
>>>>>
>>>>> Why are you submitting patches you have no way to test?
>>>>
>>>> What?  This is stable tree backporting, why are you trying to make a=

>>>> requirement for something that we have never had before?
>>>
>>> I don't think random patches should be sent to stable just because
>>> they appeared in mainline. Plus, I don't think I'm making new rules:
>>>
>>> submit-checklist.rst:
>>>
>>> 13) Has been build- and runtime tested with and without ``CONFIG_SMP`=
`
>>> and
>>>    ``CONFIG_PREEMPT.``
>>>
>>> stable-kernel-rules.rst:
>>>
>>> Rules on what kind of patches are accepted, and which ones are not,
>>> into the "-stable" tree:
>>>
>>> - It must be obviously correct and tested.
>>> - It must fix a real bug that bothers people (not a, "This could be a=

>>>   problem..." type thing).
>>
>> So you're saying that this doesn't qualify as a bug?
>>
>>>> This is a backport of a patch that is already upstream.  If it doesn=
't
>>>> belong in a stable tree, great, let us know that, saying why it is s=
o.
>>>
>>> See jacek.anaszewski@gmail.com 's explanation.
>>
>> I might be missing something, but Jacek suggested I pull another patch=

>> before this one?
>=20
> Just to clarify:
>=20
> For 4.14 below patches are chosen correctly:
>=20
> [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness setting when=

> setting delay_off=3D0
> [PATCH AUTOSEL for 4.14 094/110] leds: core: Fix regression caused by
> commit 2b83ff96f51d
>=20
> For 4.9 both above patches are needed preceded by:
>=20
> eb1610b4c273 ("led: core: Fix blink_brightness setting race")
>=20
> The issue the patch [PATCH AUTOSEL for 4.14 065/110] fixes was
> introduced in 4.7, and thus it should be removed from the series
> for 3.18 and 4.4.
>=20

It seems only "led: core: Fix brightness setting when setting delay_off=3D=
0"
was applied to 4.9. Could we get the regression fixes backported to 4.9 a=
s
well?

Thanks,
Matthias


--jhuxeFKxzYQQngyk8N8bQRSGy9wMvbJdg--

--VzJpYh3I0nuxSbH70Xnayo0eenXt5HtFM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEZmTnvaa2aYgexS51Fu8/ZMsgHZwFAlqmlfEACgkQFu8/ZMsg
HZxQDw/6AusA9QLwju+ge7yf6QF1nTkXvFUUQGfwRzAjQfjqNTsPYN3aRqt5+2sZ
Cy97IDFxLItbNjYu/reoDEijLbgxEAaQJYJZcAUKEOZ3LZC1a+n6idRgO4MQoARK
RCjs9TeYomkO2g83GyWkjYCV+5oafh01Ir3zXz9B2kfWZfSO0cwWaxAP4ecIq/VN
pP3MeoRyV6dKQBq49UBgw8GvvR/rakCFz0+S2OEStakHP0vziFVEFaKp3MQEznNx
j8GveFtfsEd5+z1jCtj06328Oht7XgTPXmakqIkkBBZoWfgMGc2laYM4UhUSsqEN
TiBCz4Yg4cnycSzgWZiJi2GXOX5k/lfbOHi6U8Twa1PieRDqZGofPLRrzDgGK2Sx
H5501US9r07maCNuTcOaMrZnHRSOED8xWNDdz/q3k1lbk5URHEUnTU4eXuS1OSPc
FuYKXCg81xhEHamTRU95ljDbujE49pHzSOka9N2PYKiCkbwEqmFF8U6Et7SPD/vv
34+Ix31UarekNXjDfxK07JkfVDYn8fXt7H0UU4a8FSs/D4knI0G39+5xCjh6TRk1
AMx62WRaPvGYG6LsyucDRDQ/CzWIMMafRnek9ARON0Q4ILoYHGF6qnSBh8z5cyIW
wAOtHd8hoGV/7A4RuUvI9BKZzajq+KUV9YcScxyZfRuhaAUNLU0=
=Li5/
-----END PGP SIGNATURE-----

--VzJpYh3I0nuxSbH70Xnayo0eenXt5HtFM--
