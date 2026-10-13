Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D740B52D2D1;
	Tue, 13 Oct 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897615; cv=none; b=Hclq8dEp1o+048Qfllw+DlNFDrjiB1GUsr5F4vLaXTekoH+nXKXMYbGeEaJ7kltKemFFGY/jxE29RiLVS7nCFNyfSWc+Ocnu/YKpbbeeXXRx/Qm0IHENfAmlpYZH7tNFnIJhGjZC+lzVVFGcBH0D3ckqPELRPPunu4a4Vm7wgdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897615; c=relaxed/simple;
	bh=PM4Rbtn21bgoM+lLkBjM7wdSl73xTdMGGOQ2yirNnZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jLDPI648qE+9tpx0Df1SCcAekdovVaoX7xvkFiaG12MSVbUgEZNC16e7wH0+AzIZ3R0b3J/DECqSqBYWCYnoY//hgH5ANBpIyIZiPiv0ob/Vva/ThVm2oLT9IqrmetCtVfg5pM8GIaOq5+kBuRWdKtDisWqJ3TmwgzX1b1hb89I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gb0Km/nn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gb0Km/nn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBF21F000FF;
	Tue, 13 Oct 2026 13:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897613;
	bh=P5+i7FvVViqR5XGn7d/roOqUutL/m7YjBgKdURYXQ0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gb0Km/nnfyjO00zOZ6NrvWE+Qrzx44oWHI1I3Q0uZPtMF5FDrUiI4MSbzg05FUmci
	 hEK/z7COT3/nz3nuevDkPEGVdUouBFf7/bZmebHW2xCFmodUk2p1CE+SzZIgdqSozs
	 yiHmE0dOkxHTLGk/4a0u2YtPHNPrELJiAwvzwiaq/CWi+OWUEK+ru9JQ4eAxZbg4ch
	 6ML0nmzh7IHeChu8oG0VUgHAKlDk5L6heMEGu5mMrpORZ7VzGExl86VZjsFRkWHUMH
	 W0Ubx3uqiqgVk4llRbLr11uO1Kr2J/fs8xuToSgaOA3JOhe754HbF01RG8VBhxKh5k
	 3beKhbiwFXuxg==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 50/53] MIPS: SGI-IP27: add L1 front-panel LED and display requests
Date: Tue, 13 Oct 2026 15:17:10 +0200
Message-ID: <2422a141898801ad0f0ae908382bee1e823517a3.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add l1_set_leds(), which sets the Fuel and Tezro front-panel LEDs, and
l1_set_display(), which writes line 2 of the Tezro's L1 display. Both
can be called from a panic notifier.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/include/asm/sn/l1.h | 16 +++++++++
 arch/mips/sgi-ip27/ip27-l1.c  | 67 +++++++++++++++++++++++++++++++++++
 2 files changed, 83 insertions(+)

diff --git a/arch/mips/include/asm/sn/l1.h b/arch/mips/include/asm/sn/l1.h
index f9fa8a8051e6..42611fe51a3a 100644
--- a/arch/mips/include/asm/sn/l1.h
+++ b/arch/mips/include/asm/sn/l1.h
@@ -7,6 +7,7 @@
 #ifndef __ASM_SN_L1_H
 #define __ASM_SN_L1_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 /*
@@ -15,8 +16,23 @@
  */
 #define L1_BOARD_COMPONENT_MAX	8
 
+/*
+ * Front-panel LEDs of a Fuel or a deskside Tezro. ON and BLINK switch off
+ * every LED outside the mask; OFF switches off only the masked ones.
+ */
+#define L1_LED_RED		BIT(0)
+#define L1_LED_WHITE		BIT(1)
+
+#define L1_LED_ON		0
+#define L1_LED_OFF		1
+#define L1_LED_BLINK		2
+
+#define L1_DISPLAY_WIDTH	16
+
 int l1_exec_command(const char *cmd);
 int l1_read_board_partnum(unsigned int component, char *buf, size_t len);
 int l1_read_brick_type(void);
+int l1_set_leds(unsigned int mask, unsigned int state);
+int l1_set_display(const char *text);
 
 #endif /* __ASM_SN_L1_H */
diff --git a/arch/mips/sgi-ip27/ip27-l1.c b/arch/mips/sgi-ip27/ip27-l1.c
index 98c94d14bd5f..3fe0214d0f91 100644
--- a/arch/mips/sgi-ip27/ip27-l1.c
+++ b/arch/mips/sgi-ip27/ip27-l1.c
@@ -26,7 +26,9 @@
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/etherdevice.h>
+#include <linux/export.h>
 #include <linux/hex.h>
+#include <linux/panic.h>
 #include <linux/serial_reg.h>
 #include <linux/spinlock.h>
 #include <linux/stdarg.h>
@@ -81,6 +83,8 @@
 /* L1_TASK_GENERAL requests */
 #define L1_REQ_BRICK_ID		0x0003	/* rack, slot and brick type */
 #define L1_REQ_EEPROM		0x0006	/* access eeprom */
+#define L1_REQ_DISP2		0x1005	/* write line 2 of the display */
+#define L1_REQ_LED		0x1009	/* set the front-panel LEDs */
 
 /* L1_REQ_EEPROM additional argument values (non C-brick component) */
 #define L1_EEP_LOGIC		0x01	/* logic board */
@@ -414,6 +418,19 @@ static int l1_response_to_errno(u32 response)
  */
 static DEFINE_SPINLOCK(l1_lock);
 
+/*
+ * Once a panic has stopped the other CPUs, one of them may hold the lock
+ * for good; the panicking CPU then goes to the wire without it.
+ */
+static bool l1_lock_irqsave(unsigned long *flags)
+{
+	if (panic_in_progress())
+		return spin_trylock_irqsave(&l1_lock, *flags);
+
+	spin_lock_irqsave(&l1_lock, *flags);
+	return true;
+}
+
 /*
  * Run one request/response exchange in pkt, which has to be large enough
  * for both; returns the response's argument count.
@@ -493,6 +510,56 @@ int l1_exec_command(const char *cmd)
 	return rc == 0 ? 0 : -EIO;
 }
 
+int l1_set_leds(unsigned int mask, unsigned int state)
+{
+	u32 address = L1_ADDRESS(L1_TYPE_L1,
+				 L1_ADDRESS_LOCAL | L1_TASK_GENERAL);
+	u8 pkt[64];		/* command and response packet buffer */
+	unsigned long flags;
+	bool locked;
+	int rc;
+
+	locked = l1_lock_irqsave(&flags);
+
+	/* arguments: LED mask, then new state, both INT */
+	rc = l1_transact(get_nasid(), pkt, sizeof(pkt), address, L1_REQ_LED,
+			 NULL, NULL, 2,
+			 L1_ARG_INT, (u32)mask, L1_ARG_INT, (u32)state);
+
+	if (locked)
+		spin_unlock_irqrestore(&l1_lock, flags);
+
+	return rc < 0 ? rc : 0;
+}
+EXPORT_SYMBOL_GPL(l1_set_leds);
+
+/*
+ * Write line 2 of the display; line 1 belongs to the L1. Padding to the
+ * full width leaves nothing of a longer earlier line behind.
+ */
+int l1_set_display(const char *text)
+{
+	u32 address = L1_ADDRESS(L1_TYPE_L1,
+				 L1_ADDRESS_LOCAL | L1_TASK_GENERAL);
+	char line[L1_DISPLAY_WIDTH + 1];
+	u8 pkt[64];		/* command and response packet buffer */
+	unsigned long flags;
+	bool locked;
+	int rc;
+
+	snprintf(line, sizeof(line), "%-*s", L1_DISPLAY_WIDTH, text);
+
+	locked = l1_lock_irqsave(&flags);
+
+	rc = l1_transact(get_nasid(), pkt, sizeof(pkt), address,
+			 L1_REQ_DISP2, NULL, NULL, 1, L1_ARG_ASCII, line);
+
+	if (locked)
+		spin_unlock_irqrestore(&l1_lock, flags);
+
+	return rc < 0 ? rc : 0;
+}
+
 /* Read a component's board IA record from EEPROM. */
 static int l1_read_board_ia(nasid_t nasid, int type, unsigned int component,
 			    u8 **ria, size_t *rialen)
-- 
2.47.3

