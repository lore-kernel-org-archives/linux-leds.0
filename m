Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436999;
	b=BP+1ZnD/0p5NYsCvu3L5eSPZyMrdxHQbr7lLL9fs/0TtfQVGBMQzEdmDfl53x/bZo0/t
	 KseiT0P7aKEerzeyD6x3dvf+5riD7u/EvnzRHtZ9C+s2ASlkfOl83vce2m2NOCV2aRdAZ
	 GC3ESgRzauFI4vFhd+d3A2uWNUWMpeGfA6TFjnp0lTcCkn89iiQgyQSMZn6WGDObIYKGT
	 MVsEEYnQiUT1I85p1jL5hmIsy1ZGTh0WRaxKZoEn2QyKoaUm7hcrz/o32cGq4o9zh0qAq
	 GSED0jtO/G2LXnFYH9tarGfaQPT/BsrSjIKDGe8kQxs47Iu6oJCSHvC0T1zXqQ23p5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436999;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=iiN7DcPSkiAudM715K7PGA4r2cpiHl8VcHMJZAmlc6o=;
	b=YtDp6y1QVjT5QBXl/xDjZRnw6yOxrnWKaVLQeYF6QpJ6ALizjaH2uYxNJ5di81EutMlY
	 rhVAQY153GZeXyk23QU4TbcEcNERM+H6jnSkVgJ3r72m7BobsLSn3O64xalLmq+N+iGUs
	 X0DMncIxWNPTIzfQE5BaAu/YSCxg3CTgV6oLzW7Y3+LI2kfGqF6p2iWm73ajB/vktuPjB
	 P6cF0yD60yU/ckfNrOeKTOT8Zuwf8CXJwpCpGbaqi3NkuEyhJogd3rwTV6HCw6DUyIOMg
	 UKbB7dMDjQl9PiWM7gJqgWtKmPhS4UfMukXXN88028OJN4BgC69F4++lmogQFeMbaZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHy6mXu+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6254606A331;
	Mon, 23 Nov 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZHy6mXu+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE921F000D1;
	Mon, 23 Nov 2026 12:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795436999;
	bh=iiN7DcPSkiAudM715K7PGA4r2cpiHl8VcHMJZAmlc6o=;
	h=From:Subject:Date:To:Cc;
	b=ZHy6mXu+LKwzrFh9y/z3uQ9Z330W8dy5p2EXVYUc42G529PX+x3aE9jasPGGVjgrw
	 uzTATw9K1bnS6xDK/lTW+SEnFiws1BLQpBOvCXch8mQ2NYUZA/aA/SlaG7vTOGHWZV
	 JxdXJU4x0LN+KBiCvY7bHE9TL4NNIg3VcwlaF8aO6Jaws3TK+E5gddt9uzbRhw2Ccu
	 sS1U8PERXdVC6rRwY381g/5+0wltg0MGoREEHnlqZ5K3f9l4abYrSkTAXW6CaAJACx
	 YLORBNNo8+hRhlPyC1pgPWBV42f9FJrWIkI10joKYQzh1uxO8yKCCmSkxmgBstfd3B
	 JW1EzZq1SKa3w==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/3] Convert National Semiconductor GPIO drivers to gpiolib
Date: Mon, 23 Nov 2026 13:29:52 +0100
Message-Id: <20261123-b4-nsc-gpio-v1-0-b2d97eba2662@kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQqEIBAG4KsM/3MDae4aXiV6SHesebFQiIXo7
 kHfAb4LTapKQ6ALVU5tuhcEMh0hbUtZhfWHQLC9/RpjB46OS0u8Hrrz6D/O5xizjw4d4aiS9f9
 u03zfD/h21n5dAAAA
X-Change-ID: 20261123-b4-nsc-gpio-87547fbbf7b4
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Christer Weinigel <christer@weinigel.se>, Jim Cromie <jim.cromie@gmail.com>, 
 x86@kernel.org, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org
X-Mailer: b4 0.16.0

This is an obvious attack patch to see if anyone is really using
the custom API from these deviant drivers/char/* GPIO drivers
from the early 2000s.

Probe PC8736x through the ISA bus API and create the SCx200 GPIO device
from its PCI bridge. Register both controllers with gpiolib using port
I/O. Describe the net48xx and WRAP LED GPIOs with software nodes and
switch both LED drivers to descriptors.

Remove the private GPIO API and per-pin character devices. We assume
there are no remaining users of the old NSC GPIO userspace ABI.

An LLM assisted in the implementation and x86-32 build checks.

---
Linus Walleij (3):
      gpio: convert PC8736x to gpiolib
      gpio: convert SCx200 to gpiolib and use descriptors for board LEDs
      gpio: remove the legacy NSC GPIO API

 MAINTAINERS                          |   6 +-
 arch/x86/platform/scx200/scx200_32.c |  90 ++++-----
 drivers/char/Kconfig                 |  33 ----
 drivers/char/Makefile                |   3 -
 drivers/char/nsc_gpio.c              | 126 -------------
 drivers/char/pc8736x_gpio.c          | 352 -----------------------------------
 drivers/char/scx200_gpio.c           | 138 --------------
 drivers/gpio/Kconfig                 |  22 +++
 drivers/gpio/Makefile                |   2 +
 drivers/gpio/gpio-pc8736x.c          | 264 ++++++++++++++++++++++++++
 drivers/gpio/gpio-scx200.c           | 245 ++++++++++++++++++++++++
 drivers/leds/leds-net48xx.c          |  85 +++++----
 drivers/leds/leds-wrap.c             | 143 +++++++-------
 include/linux/nsc_gpio.h             |  41 ----
 include/linux/scx200.h               |   1 +
 include/linux/scx200_gpio.h          |  89 ---------
 16 files changed, 697 insertions(+), 943 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261123-b4-nsc-gpio-87547fbbf7b4

Best regards,
--  
Linus Walleij <linusw@kernel.org>

