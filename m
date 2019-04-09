From: Vadim Pasternak <vadimp@mellanox.com>
Subject: RE: [PATCH v1 bitops] bitops: Fix UBSAN undefined behavior warning
 for rotation right
Date: Tue, 9 Apr 2019 07:36:06 +0000
Message-ID: <AM6PR05MB52246C74B34F291F5D89A409A22D0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20190407125325.24440-1-vadimp@mellanox.com>
 <20190408155217.3f723554ae7fbcb34eeacb30@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190408155217.3f723554ae7fbcb34eeacb30@linux-foundation.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>, "pavel@ucw.cz" <pavel@ucw.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Ido Schimmel <idosch@mellanox.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>
List-Id: linux-leds@vger.kernel.org



> -----Original Message-----
> From: Andrew Morton <akpm@linux-foundation.org>
> Sent: Tuesday, April 09, 2019 1:52 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: jacek.anaszewski@gmail.com; pavel@ucw.cz; linux-kernel@vger.kernel.or=
g;
> linux-leds@vger.kernel.org; Ido Schimmel <idosch@mellanox.com>; Andrey
> Ryabinin <aryabinin@virtuozzo.com>
> Subject: Re: [PATCH v1 bitops] bitops: Fix UBSAN undefined behavior warni=
ng
> for rotation right
>=20
> (resend, cc Andrey)
>=20
> On Sun,  7 Apr 2019 12:53:25 +0000 Vadim Pasternak <vadimp@mellanox.com>
> wrote:
>=20
> > The warning is caused by call to rorXX(), if the second parameters of
> > this function "shift" is zero. In such case UBSAN reports the warning
> > for the next expression: (word << (XX - shift), where XX is 64, 32,
> > 16, 8 for respectively ror64, ror32, ror16, ror8.
> > Fix adds validation of this parameter - in case it's equal zero, no
> > need to rotate, just original "word" is to be returned to caller.
> >
> > The UBSAN undefined behavior warning has been reported for call to
> > ror32():
> > [   11.426543] UBSAN: Undefined behaviour in ./include/linux/bitops.h:9=
3:33
> > [   11.434045] shift exponent 32 is too large for 32-bit type 'unsigned=
 int'
>=20
> hm, do we care?

Hi Andrew,

Thank for reply.

We want to avoid UBSAN undefined behavior warning in case
"shift" parameter is not provided as a constant.

>=20
> > ...
> >
>=20
> > --- a/include/linux/bitops.h
> > +++ b/include/linux/bitops.h
> > @@ -70,6 +70,9 @@ static inline __u64 rol64(__u64 word, unsigned int sh=
ift)
> >   */
> >  static inline __u64 ror64(__u64 word, unsigned int shift)  {
> > +	if (!shift)
> > +		return word;
> > +
> >  	return (word >> shift) | (word << (64 - shift));  }
>=20
> Is there any known architecture or compiler for which UL<<64 doesn't reli=
ably
> produce zero?  Is there any prospect that this will become a problem in t=
he
> future?

I don't know about such architecture.
Do you think it could be modified only for ro8, ror16, ror32?
