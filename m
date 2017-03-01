From: =?UTF-8?Q?Marco_Trevisan_=28Trevi=C3=B1o=29?= <mail@3v1n0.net>
Subject: Re: [PATCH v8 1/7] platform/x86/thinkpad_acpi: Stop setting
 led_classdev brightness directly
Date: Wed, 1 Mar 2017 15:24:57 +0100
Message-ID: <CAALaScnmXC4OypRcg6ygP2C34ADD1nOMEEGHOnur8ZRcnD5g-g@mail.gmail.com>
References: <20170209154417.19040-1-hdegoede@redhat.com> <20170209154417.19040-2-hdegoede@redhat.com>
 <20170301112700.GD3185@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170301112700.GD3185@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, "open list:THINKPAD ACPI EXTRAS DRIVER" <platform-driver-x86@vger.kernel.org>, linux-leds@vger.kernel.org, Marco Trevisan <mail@3v1n0.net>
List-Id: linux-leds@vger.kernel.org

2017-03-01 12:27 GMT+01:00 Pali Roh=C3=A1r <pali.rohar@gmail.com>:
>> @@ -5164,7 +5162,7 @@ static void kbdlight_set_worker(struct work_struct=
 *work)
>>                       container_of(work, struct tpacpi_led_classdev, wor=
k);
>>
>>       if (likely(tpacpi_lifecycle =3D=3D TPACPI_LIFE_RUNNING))
>> -             kbdlight_set_level_and_update(data->new_state);
>> +             kbdlight_set_level(data->new_state);
>>  }
>>
>>  static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
>
> Hi! This change was added in commit afcedebc6a0 (thinkpad_acpi: save
> kbdlight state on suspend and restore it on resume). It is really OK to
> revert that change?
>
> CCing Marco who is author of that commit.


I think that as per commit c685e20df this is actually not needed
anymore, as it will be userspace to handle that.
So it's fine to me.

Thanks for asking, though
